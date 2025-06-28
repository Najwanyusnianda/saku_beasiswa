// lib/features/templates/presentation/widgets/wizard/wizard_step_2_timeline.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/customise_wizard_provider.dart';
import 'package:saku_beasiswa/features/templates/presentation/widgets/wizard/wizard_card.dart';

class WizardStep2Timeline extends ConsumerWidget {
  final String templateId;
  const WizardStep2Timeline({super.key, required this.templateId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wizardState = ref.watch(customiseWizardProvider(templateId)).value;
    if (wizardState == null) return const Center(child: CircularProgressIndicator());
    
    // Main deadline is always set (non-nullable) so we don't need to check for null
    
    // Filter milestones based on planning mode
    final visibleMilestones = wizardState.fullTemplate.milestonesWithTasks.entries.where((entry) {
      final milestone = entry.key;
      // If the user is in specificDate mode, hide any planning-only milestones
      if (wizardState.deadlineMode == DeadlineMode.specificDate && milestone.isPlanningOnly) {
        return false;
      }
      return true;
    }).toList();

    return WizardCard(
      step: 2,
      title: 'Review Your Timeline',
      child: Column(
        children: [
          const Text(
            "Here is your calculated schedule. You can adjust individual milestone deadlines or uncheck tasks you don't need.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ...visibleMilestones.map((entry) {
            return _MilestoneEditorTile(
              milestone: entry.key,
              tasks: entry.value,
              wizardState: wizardState,
              templateId: templateId,
            );
          })
        ],
      ),
    );
  }
}

class _MilestoneEditorTile extends ConsumerWidget {
  final TemplateMilestone milestone;
  final List<TemplateTask> tasks;
  final CustomiseWizardState wizardState;
  final String templateId;

  const _MilestoneEditorTile({
    required this.milestone,
    required this.tasks,
    required this.wizardState,
    required this.templateId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(customiseWizardProvider(templateId).notifier);
    
    // --- The Magic of Calculation ---
    // Check if there's a user override, otherwise calculate the date.
    final milestoneEndDate = wizardState.milestoneDeadlineOverrides[milestone.id] ??
        wizardState.mainDeadline.add(Duration(days: milestone.endDateOffsetDays));

    // Calculate task progress for this milestone
    final includedTasksForThisMilestone = tasks
        .where((task) => wizardState.customizedTasks.any((t) => t.id == task.id))
        .length;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        title: Text(milestone.name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(
          '${DateFormat.yMMMMd().format(milestoneEndDate)}  •  $includedTasksForThisMilestone of ${tasks.length} tasks included',
        ),
        // Add a button to let the user override the date
        trailing: IconButton(
          icon: const Icon(Icons.edit_calendar_outlined),
          onPressed: () async {
            final newDate = await showDatePicker(
              context: context,
              initialDate: milestoneEndDate,
              firstDate: DateTime(2020),
              lastDate: DateTime(2040),
            );
            if (newDate != null) {
              notifier.setMilestoneDeadlineOverride(milestone.id, newDate);
            }
          },
        ),
        children: tasks.map((task) {
          return CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(task.label),
            value: wizardState.customizedTasks.any((t) => t.id == task.id),
            onChanged: (isChecked) => notifier.toggleTask(task, isChecked!),
            dense: true,
          );
        }).toList(),
      ),
    );
  }
}