import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/typography.dart';
import '../../application/edit_profile_service.dart';
import '../../application/profile_service.dart';
import '../widgets/edit_profile_form.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Load current profile data when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(editProfileNotifierProvider.notifier).loadCurrentProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final editState = ref.watch(editProfileNotifierProvider);
    final currentProfile = ref.watch(watchProfileProvider);
    
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        
        final hasUnsavedChanges = editState.hasUnsavedChanges;
        if (!hasUnsavedChanges) {
          context.pop();
          return;
        }
        
        // Show unsaved changes confirmation dialog
        final shouldDiscard = await _showUnsavedChangesDialog();
        if (shouldDiscard == true && context.mounted) {
          context.pop();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () async {
              if (editState.hasUnsavedChanges) {
                final shouldDiscard = await _showUnsavedChangesDialog();
                if (shouldDiscard == true && context.mounted) {
                  context.pop();
                }
              } else {
                context.pop();
              }
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.onSurface,
            ),
          ),
          title: Text(
            'Edit Profile',
            style: AppTypography.lightTextTheme.headlineMedium?.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: currentProfile.when(
          data: (profile) {
            if (profile == null) {
              return Center(
                child: Text(
                  'No profile found',
                  style: AppTypography.lightTextTheme.bodyLarge?.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              );
            }
            
            return Column(
              children: [
                // Form content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: EditProfileForm(
                      initialProfile: profile,
                      onFieldChanged: () {
                        ref.read(editProfileNotifierProvider.notifier).markAsChanged();
                      },
                    ),
                  ),
                ),
                
                // Save button
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    border: Border(
                      top: BorderSide(
                        color: AppColors.border.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                  ),
                  child: SafeArea(
                    child: editState.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: editState.isFormValid ? () => _saveProfile() : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.onPrimary,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                disabledBackgroundColor: AppColors.onSurfaceVariant,
                              ),
                              child: Text(
                                'Save Changes',
                                style: AppTypography.lightTextTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 48,
                  color: AppColors.error,
                ),
                const SizedBox(height: 16),
                Text(
                  'Failed to load profile',
                  style: AppTypography.lightTextTheme.headlineSmall?.copyWith(
                    color: AppColors.error,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  style: AppTypography.lightTextTheme.bodyMedium?.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> _showUnsavedChangesDialog() {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(
          'Unsaved Changes',
          style: AppTypography.lightTextTheme.headlineSmall?.copyWith(
            color: AppColors.onSurface,
          ),
        ),
        content: Text(
          'You have unsaved changes. Are you sure you want to discard them?',
          style: AppTypography.lightTextTheme.bodyMedium?.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'Cancel',
              style: AppTypography.lightTextTheme.bodyMedium?.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              'Discard',
              style: AppTypography.lightTextTheme.bodyMedium?.copyWith(
                color: AppColors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveProfile() async {
    try {
      await ref.read(editProfileNotifierProvider.notifier).saveProfile();
      
      if (context.mounted) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Profile updated successfully',
              style: AppTypography.lightTextTheme.bodyMedium?.copyWith(
                color: AppColors.onPrimary,
              ),
            ),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
          ),
        );
        
        // Navigate back
        context.pop();
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to save profile: $error',
              style: AppTypography.lightTextTheme.bodyMedium?.copyWith(
                color: AppColors.onPrimary,
              ),
            ),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }
}
