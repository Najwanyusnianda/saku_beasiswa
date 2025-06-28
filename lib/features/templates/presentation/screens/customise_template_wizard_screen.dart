// lib/features/templates/presentation/screens/customise_template_wizard_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/customise_wizard_provider.dart';
// Import the refactored step widgets
import 'package:saku_beasiswa/features/templates/presentation/widgets/wizard/wizard_step_1_deadline.dart';
import 'package:saku_beasiswa/features/templates/presentation/widgets/wizard/wizard_step_2_timeline.dart';
import 'package:saku_beasiswa/features/templates/presentation/widgets/wizard/wizard_step_3_personalise.dart';


class CustomiseTemplateWizardScreen extends ConsumerStatefulWidget {
  final String templateId;
  const CustomiseTemplateWizardScreen({super.key, required this.templateId});

  @override
  ConsumerState<CustomiseTemplateWizardScreen> createState() => _CustomiseTemplateWizardScreenState();
}

class _CustomiseTemplateWizardScreenState extends ConsumerState<CustomiseTemplateWizardScreen> {
  final _pageController = PageController();
  int _currentPage = 0;
  static const _numPages = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  
  // Method to handle finishing the wizard
  void _finishWizard() async {
    final wizardState = ref.read(customiseWizardProvider(widget.templateId)).value;
    if (wizardState == null) return;
    
    // No need to check for null mainDeadline as it's non-nullable

     // Set saving state
    ref.read(isSavingProvider.notifier).start();

    try {
    // This now returns the newly created UserApplication
      final newApp = await ref.read(applicationRepositoryProvider).createCustomApplication(wizardState);

      if (!mounted) return;
    // Go to the applications tab to see the new entry
      context.go('/applications/${newApp.id}');
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('✅ Application plan created successfully!'),
        behavior: SnackBarBehavior.floating,
      ),
    );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
    finally {
      ref.read(isSavingProvider.notifier).stop();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final wizardStateAsync = ref.watch(customiseWizardProvider(widget.templateId));
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customize Application'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: wizardStateAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (wizardState) {
          return PageView(
            controller: _pageController,
            onPageChanged: (page) => setState(() => _currentPage = page),
            children: [
              WizardStep1Deadline(templateId: widget.templateId),
              WizardStep2Timeline(templateId: widget.templateId), // <-- USE THE NEW WIDGET
              WizardStep3Personalise(templateId: widget.templateId),
            ],
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    final isLastPage = _currentPage == _numPages - 1;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // --- Progress Indicator ---
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_numPages, (index) => 
                Container(
                  width: 10, height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage >= index ? AppColors.primary : Colors.grey.shade300,
                  ),
                )
              ),
            ),
            const SizedBox(height: 16),
            // --- Action Buttons ---
            Row(
              children: [
                if (_currentPage > 0)
                  TextButton(
                    onPressed: () => _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut),
                    child: const Text('Back'),
                  ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    if (isLastPage) {
                      _finishWizard();
                    } else {
                      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                    }
                  },
                  child: Text(isLastPage ? 'Finish & Add' : 'Next Step'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}