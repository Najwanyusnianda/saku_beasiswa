// lib/features/templates/presentation/widgets/wizard/wizard_step_2_timeline.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/models/full_template_plan.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/customise_wizard_provider.dart';
import 'package:saku_beasiswa/features/templates/presentation/screens/milestone_library_screen.dart';
import 'package:saku_beasiswa/features/templates/presentation/widgets/wizard/wizard_card.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';

class WizardStep2Timeline extends ConsumerWidget {
  final String templateId;
  const WizardStep2Timeline({super.key, required this.templateId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wizardState = ref.watch(customiseWizardProvider(templateId)).value;
    final notifier = ref.read(customiseWizardProvider(templateId).notifier);
    
    if (wizardState == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return WizardCard(
      step: 2,
      title: 'Build Your Plan',
      child: Column(
        mainAxisSize: MainAxisSize.max, 
        children: [
          // --- IMPROVEMENT: Better instructions ---
          const ListTile(
            leading: Icon(Iconsax.info_circle, color: AppColors.primary),
            dense: true,
            title: Text('Drag to reorder. Swipe left to remove. Tap date to edit. You can also edit later'),
          ),
          const SizedBox(height: 8),

          Expanded(
            child: ReorderableListView.builder(
              padding: const EdgeInsets.only(top: 8),
              itemCount: wizardState.currentUserMilestones.length,
              itemBuilder: (context, index) {
                final assembledMilestone = wizardState.currentUserMilestones[index];
                return Dismissible(
                  key: ValueKey(assembledMilestone.milestoneTemplate.id),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) {
                    notifier.removeMilestone(assembledMilestone);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${assembledMilestone.milestoneTemplate.name} removed.'))
                    );
                  },
                  background: Container(
                    color: AppColors.error.withValues(alpha: 0.8),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Iconsax.trash, color: Colors.white),
                  ),
                  child: _PlanBuilderMilestoneTile(
                    key: ValueKey('tile-${assembledMilestone.milestoneTemplate.id}'),
                    assembledMilestone: assembledMilestone,
                  ),
                );
              },
              onReorder: (oldIndex, newIndex) => notifier.reorderMilestone(oldIndex, newIndex),
            ),
          ),
          const SizedBox(height: 16),
          // --- IMPROVEMENT: Clearer Button Label ---
          OutlinedButton.icon(
            icon: const Icon(Iconsax.add_square),
            label: const Text('Add Milestone from Examples'),
            onPressed: () async {
              // --- WIRE UP THE NAVIGATION ---
              // Show the library screen as a modal page
              final selectedMilestone = await Navigator.of(context).push<MilestoneTemplate>(
                MaterialPageRoute(
                  builder: (context) => const MilestoneLibraryScreen(),
                  fullscreenDialog: true, // Presents it as a modal overlay
                ),
              );

              // If the user selected a milestone (didn't just press back)
              if (selectedMilestone != null) {
                // Call the provider method to add it to the state
                notifier.addMilestoneFromLibrary(selectedMilestone);
              }
            },
          )
        ],
      ),
    );
  }
}

class _PlanBuilderMilestoneTile extends ConsumerWidget {
  final AssembledMilestone assembledMilestone;

  const _PlanBuilderMilestoneTile({super.key, required this.assembledMilestone});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templateId = assembledMilestone.link.scholarshipTemplateId;
    final notifier = ref.read(customiseWizardProvider(templateId).notifier);
    final wizardState = ref.watch(customiseWizardProvider(templateId)).value!;
    
    // --- FEATURE #1: Calculate the actual deadline for this milestone ---
    final milestoneTemplateId = assembledMilestone.milestoneTemplate.id;
    final milestoneEndDate = wizardState.milestoneDeadlineOverrides[milestoneTemplateId] ??
        wizardState.mainDeadline.add(Duration(days: assembledMilestone.link.endDateOffsetDays));
    
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(
        title: Text(
          assembledMilestone.milestoneTemplate.name, 
          style: const TextStyle(fontWeight: FontWeight.w600)
        ),
        // --- FEATURE #1 (cont.): Display the deadline ---
        subtitle: InkWell(
          onTap: () => _editMilestoneDate(context, ref, milestoneTemplateId, milestoneEndDate),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Iconsax.calendar_1, 
                size: 14, 
                color: wizardState.milestoneDeadlineOverrides.containsKey(milestoneTemplateId) 
                  ? AppColors.primary // Highlight if overridden
                  : AppColors.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                'Due: ${DateFormat.yMMMd().format(milestoneEndDate)}',
                style: TextStyle(
                  color: wizardState.milestoneDeadlineOverrides.containsKey(milestoneTemplateId) 
                    ? AppColors.primary 
                    : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        leading: ReorderableDragStartListener(
          index: wizardState.currentUserMilestones.indexOf(assembledMilestone),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Iconsax.menu_1),
          ),
        ),
        children: assembledMilestone.taskTemplates.map((task) {
          return CheckboxListTile(
            title: Text(task.label),
            value: wizardState.currentUserTasks.any((t) => t.id == task.id),
            onChanged: (isChecked) => notifier.toggleTask(task, isChecked ?? false),
            dense: true,
          );
        }).toList(),
      ),
    );
  }

  // --- FEATURE #2: Method to handle editing the date ---
  Future<void> _editMilestoneDate(BuildContext context, WidgetRef ref, int milestoneTemplateId, DateTime currentDate) async {
    final notifier = ref.read(customiseWizardProvider(assembledMilestone.link.scholarshipTemplateId).notifier);
    final newDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2040),
    );
    if (newDate != null) {
      notifier.setMilestoneDeadlineOverride(milestoneTemplateId, newDate);
    }
  }
}