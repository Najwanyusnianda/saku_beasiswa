import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/customise_wizard_provider.dart';
import 'package:saku_beasiswa/features/templates/presentation/widgets/wizard/wizard_card.dart';

class WizardStep3Personalise extends ConsumerStatefulWidget {
  final String templateId;
  const WizardStep3Personalise({super.key, required this.templateId});

  @override
  ConsumerState<WizardStep3Personalise> createState() => _WizardStep3PersonaliseState();
}

class _WizardStep3PersonaliseState extends ConsumerState<WizardStep3Personalise> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    final wizardState = ref.read(customiseWizardProvider(widget.templateId)).value;

    String suggestedName = '';
    // Check if wizardState is not null before accessing its properties
    if (wizardState != null) {
      // Since mainDeadline is non-nullable, we can safely use it
      suggestedName =
          '${wizardState.fullTemplatePlan.scholarshipTemplate.name} ${wizardState.mainDeadline.year}';
    }
    
    _nameController = TextEditingController(text: suggestedName);

    // Update the provider after the first frame to avoid build-time errors
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(customiseWizardProvider(widget.templateId).notifier)
           .setCustomName(suggestedName);
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(customiseWizardProvider(widget.templateId).notifier);

    return WizardCard(
      step: 3,
      title: 'Personalise Your Application',
      child: Column(
        children: [
          const Text(
            "Give your application a custom name to track it easily.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Application Name',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => notifier.setCustomName(value),
          ),
          // We can add the color picker here later if needed
        ],
      ),
    );
  }
}