import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/customise_wizard_provider.dart';
import 'package:saku_beasiswa/features/templates/presentation/widgets/wizard_step_1_deadline.dart';
import 'package:saku_beasiswa/features/templates/presentation/widgets/wizard_step_2_tasks.dart';
import 'package:saku_beasiswa/features/templates/presentation/widgets/wizard_step_3_personalise.dart';
import 'package:go_router/go_router.dart';

// Convert to a ConsumerStatefulWidget
class CustomiseTemplateWizardScreen extends ConsumerStatefulWidget {
  final String templateId;
  const CustomiseTemplateWizardScreen({super.key, required this.templateId});

  @override
  ConsumerState<CustomiseTemplateWizardScreen> createState() => _CustomiseTemplateWizardScreenState();
}

class _CustomiseTemplateWizardScreenState extends ConsumerState<CustomiseTemplateWizardScreen> {
  final _pageController = PageController();
  int _currentPage = 0;
  final _numPages = 3;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }
  
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wizardStateAsync = ref.watch(customiseWizardProvider(widget.templateId));
    
    return Scaffold(
      appBar: AppBar(title: const Text('Customise Application')),
      body: wizardStateAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (wizardState) {
          // Use a PageView for the steps
          return PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(), // Disable swiping
            children: [
              WizardStep1Deadline(wizardState: wizardState, templateId: widget.templateId),
              WizardStep2Tasks(wizardState: wizardState, templateId: widget.templateId),
              WizardStep3Personalise(wizardState: wizardState, templateId: widget.templateId),
            ],
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  // --- WIDGET FOR THE BOTTOM NAVIGATION ---
 // --- CORRECTED WIDGET FOR THE BOTTOM NAVIGATION ---
  Widget _buildBottomNavBar(BuildContext context) {
    // 1. Watch the provider here to get the state
    final wizardStateAsync = ref.watch(customiseWizardProvider(widget.templateId));

    // 2. Define isLastPage here
    final isLastPage = _currentPage == _numPages - 1;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (_currentPage > 0)
              TextButton(
                onPressed: () {
                  _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                },
                child: const Text('Back'),
              ),
            const Spacer(),

            // 3. Handle loading/error state for the button
            ElevatedButton(
              onPressed: wizardStateAsync.maybeWhen(
                data: (wizardState) {
                  // This is the function that runs when the button is enabled
                  return () {
                    if (isLastPage) {
                      if (wizardState.mainDeadline == null) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please set a main deadline first.')));
                        return;
                      }
                      ref.read(applicationRepositoryProvider).createCustomApplication(wizardState);
                      context.go('/applications');
                    } else {
                      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                    }
                  };
                },
                // If loading or error, disable the button by returning null
                orElse: () => null,
              ),
              child: Text(isLastPage ? 'Finish & Add Application' : 'Next'),
            ),
          ],
        ),
      ),
    );
  }
}

