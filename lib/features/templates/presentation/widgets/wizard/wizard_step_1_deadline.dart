import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/customise_wizard_provider.dart';
import 'package:saku_beasiswa/features/templates/presentation/widgets/wizard/wizard_card.dart';

class WizardStep1Deadline extends ConsumerWidget {
  final String templateId;
  const WizardStep1Deadline({super.key, required this.templateId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wizardState = ref.watch(customiseWizardProvider(templateId)).value!;
    final notifier = ref.read(customiseWizardProvider(templateId).notifier);

    return WizardCard(
      step: 1,
      title: 'Set Your Target Deadline',
      child: Column(
        children: [
          const Text(
            "When is the final application deadline? We'll use this to schedule your tasks.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            wizardState.mainDeadline == null
                ? 'Not Set'
                : DateFormat.yMMMMd().format(wizardState.mainDeadline!),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            icon: const Icon(Icons.calendar_today),
            label: Text(wizardState.mainDeadline == null ? 'Select a Date' : 'Change Date'),
            onPressed: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: wizardState.mainDeadline ?? DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
              );
              if (pickedDate != null) {
                notifier.setMainDeadline(pickedDate);
              }
            },
          ),
        ],
      ),
    );
  }
}