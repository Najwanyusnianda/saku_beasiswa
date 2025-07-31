import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/models/user_profile.dart';
import '../../../application/profile_completion_calculator.dart';

class ProfileHeaderSection extends StatelessWidget {
  final AsyncValue<UserProfile?> profileAsync;

  const ProfileHeaderSection({super.key, required this.profileAsync});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 220, // Increased height for completion indicator
      pinned: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      actions: [
        // Edit Profile Button
        IconButton(
          onPressed: () => context.go('/edit-profile'),
          icon: const Icon(Icons.edit, color: Colors.white),
          tooltip: 'Edit Profile',
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.8),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Profile photo with edit overlay
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: profileAsync.when(
                      data: (profile) => _buildProfilePhoto(context, profile),
                      loading: () => const CircularProgressIndicator(
                        color: Colors.grey,
                        strokeWidth: 2,
                      ),
                      error: (_, __) => Icon(
                        Icons.person,
                        size: 35,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // User information and completion status
                  Flexible(
                    child: profileAsync.when(
                      data: (profile) => _buildProfileInfo(context, profile),
                      loading: () => const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(color: Colors.white),
                          SizedBox(height: 6),
                          Text(
                            'Loading profile...',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      error: (error, stack) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Colors.white,
                            size: 24,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Error loading profile',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              // Trigger retry by rebuilding the parent widget
                            },
                            child: const Text(
                              'Retry',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePhoto(BuildContext context, UserProfile? profile) {
    // For now, always show the default avatar
    // TODO: Implement profile photo loading when photo picker is added
    return Icon(
      Icons.person,
      size: 40,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  Widget _buildProfileInfo(BuildContext context, UserProfile? profile) {
    if (profile == null) {
      return Column(
        children: [
          Text(
            'Complete your profile to get started!',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              '0% Complete',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );
    }

    final completionPercentage =
        ProfileCompletionCalculator.calculateCompletionPercentage(profile);
    final completionMessage = ProfileCompletionCalculator.getCompletionMessage(
      completionPercentage,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          profile.fullName,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          '${profile.majorField} Student',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.white.withOpacity(0.9)),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          profile.institution,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.white.withOpacity(0.9)),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),

        // Profile completion indicator
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: _getCompletionColor(completionPercentage),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _getCompletionIcon(completionPercentage),
                size: 14,
                color: Colors.white,
              ),
              const SizedBox(width: 4),
              Text(
                completionMessage,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color _getCompletionColor(int percentage) {
    if (percentage >= 90) {
      return Colors.green.withOpacity(0.8);
    } else if (percentage >= 70) {
      return Colors.orange.withOpacity(0.8);
    } else {
      return Colors.red.withOpacity(0.8);
    }
  }

  IconData _getCompletionIcon(int percentage) {
    if (percentage >= 90) {
      return Icons.check_circle;
    } else if (percentage >= 70) {
      return Icons.hourglass_top;
    } else {
      return Icons.edit;
    }
  }
}
