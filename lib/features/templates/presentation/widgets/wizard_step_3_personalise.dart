import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/customise_wizard_provider.dart';

class WizardStep3Personalise extends ConsumerWidget {
  final CustomiseWizardState wizardState;
  final String templateId;
  const WizardStep3Personalise({super.key, required this.wizardState, required this.templateId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(24.0),
      children: [
        Text('Step 3: Personalise', style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('Give this application a unique name and color to easily identify it in your list.'),
        const SizedBox(height: 24),
        
        TextFormField(
          initialValue: wizardState.customName,
          decoration: const InputDecoration(
            labelText: 'Application Name',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            ref.read(customiseWizardProvider(templateId).notifier).setCustomName(value);
          },
        ),
      ],
    );
  }
}
