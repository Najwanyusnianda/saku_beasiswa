import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/customise_wizard_provider.dart';
import 'package:saku_beasiswa/features/templates/presentation/widgets/wizard/wizard_card.dart';

class WizardStep3Personalise extends ConsumerWidget {
  final String templateId;
  const WizardStep3Personalise({super.key, required this.templateId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wizardState = ref.watch(customiseWizardProvider(templateId)).value!;
    final notifier = ref.read(customiseWizardProvider(templateId).notifier);

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
            initialValue: wizardState.customName,
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