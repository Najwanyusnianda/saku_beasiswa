// lib/features/templates/presentation/widgets/wizard/wizard_step_1_deadline.dart
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
  final textTheme = Theme.of(context).textTheme;

  return WizardCard(
    step: 1,
    title: 'Set Your Target Deadline',
    child: Column(
      children: [
        RadioListTile<DeadlineMode>(
          title: const Text("I know the final deadline"),
          value: DeadlineMode.specificDate,
          groupValue: wizardState.deadlineMode,
          onChanged: (mode) => notifier.setDeadlineMode(mode!),
        ),
        if (wizardState.deadlineMode == DeadlineMode.specificDate)
          OutlinedButton.icon(
            icon: const Icon(Icons.calendar_today),
            label: Text(DateFormat.yMMMMd().format(wizardState.mainDeadline)),
            onPressed: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: wizardState.mainDeadline,
                firstDate: DateTime.now(),
                lastDate: DateTime(2040),
              );
              if (pickedDate != null) notifier.setMainDeadline(pickedDate);
            },
          ),
            
        RadioListTile<DeadlineMode>(
          title: const Text("I'm just planning ahead"),
          value: DeadlineMode.planningDuration,
          groupValue: wizardState.deadlineMode,
          onChanged: (mode) => notifier.setDeadlineMode(mode!),
        ),
        if (wizardState.deadlineMode == DeadlineMode.planningDuration)
          SegmentedButton<int>(
            segments: const [
              ButtonSegment(value: 3, label: Text('3 mo')),
              ButtonSegment(value: 6, label: Text('6 mo')),
              ButtonSegment(value: 9, label: Text('9 mo')),
            ],
            selected: {wizardState.planningDurationInMonths},
            onSelectionChanged: (newSelection) => notifier.setPlanningDuration(newSelection.first),
          ),
        
        const SizedBox(height: 24),

        // --- NEW: Informative Display of the Calculated Deadline ---
        Text(
          'Your Estimated Deadline:',
          style: textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
        ),
        Text(
          DateFormat.yMMMMd().format(wizardState.mainDeadline),
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        if (wizardState.deadlineMode == DeadlineMode.planningDuration)
          Text(
            "(Based on a ${wizardState.planningDurationInMonths}-month plan from today)",
            style: textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
          ),
      ],
    ),
  );
}
}