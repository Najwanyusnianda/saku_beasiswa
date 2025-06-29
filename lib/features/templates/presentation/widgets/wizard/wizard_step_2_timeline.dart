// lib/features/templates/presentation/widgets/wizard/wizard_step_2_timeline.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:saku_beasiswa/core/models/full_template_plan.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/customise_wizard_provider.dart';
import 'package:saku_beasiswa/features/templates/presentation/widgets/wizard/wizard_card.dart';

class WizardStep2Timeline extends ConsumerWidget {
  final String templateId;
  const WizardStep2Timeline({super.key, required this.templateId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wizardState = ref.watch(customiseWizardProvider(templateId)).value;
    final notifier = ref.read(customiseWizardProvider(templateId).notifier);
    if (wizardState == null) return const Center(child: CircularProgressIndicator());

    return WizardCard(
      step: 2,
      title: 'Build Your Plan',
      child: Expanded(
        child: Column(
          children: [
            const Text(
              "Drag to reorder milestones, or swipe to remove them. Expand to manage tasks.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Expanded(
              // The ReorderableListView is the key widget here
              child: ReorderableListView.builder(
                itemCount: wizardState.userAssembledMilestones.length,
                itemBuilder: (context, index) {
                  final assembledMilestone = wizardState.userAssembledMilestones[index];
                  // Use a Dismissible to allow swiping to remove
                  return Dismissible(
                    key: ValueKey(assembledMilestone.milestoneTemplate.id),
                    direction: DismissDirection.endToStart,
                    onDismissed: (_) => notifier.removeMilestone(assembledMilestone),
                    background: Container(
                      color: Colors.red.shade700,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Iconsax.trash, color: Colors.white),
                    ),
                    child: _PlanBuilderMilestoneTile(
                      key: ValueKey('tile-${assembledMilestone.milestoneTemplate.id}'),
                      assembledMilestone: assembledMilestone,
                      wizardState: wizardState,
                      templateId: templateId,
                    ),
                  );
                },
                onReorder: (oldIndex, newIndex) => notifier.reorderMilestone(oldIndex, newIndex),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              icon: const Icon(Iconsax.add_square),
              label: const Text('Add Milestone from Library'),
              onPressed: () { /* TODO: Open Milestone Library screen */ },
            )
          ],
        ),
      ),
    );
  }
}

// A new widget for the reorderable list tile
class _PlanBuilderMilestoneTile extends ConsumerWidget {
  final AssembledMilestone assembledMilestone;
  final CustomiseWizardState wizardState;
  final String templateId;

  const _PlanBuilderMilestoneTile({
    super.key, 
    required this.assembledMilestone, 
    required this.wizardState, 
    required this.templateId
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(customiseWizardProvider(templateId).notifier);
    
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(
        title: Text(
          assembledMilestone.milestoneTemplate.name, 
          style: const TextStyle(fontWeight: FontWeight.w600)
        ),
        leading: const Icon(Iconsax.menu_1), // Drag handle icon
        children: assembledMilestone.taskTemplates.map((task) {
          return CheckboxListTile(
            title: Text(task.label ?? 'Unnamed Task'),
            value: wizardState.userCustomizedTasks.any((t) => t.id == task.id),
            onChanged: (isChecked) => notifier.toggleTask(task, isChecked ?? false),
            dense: true,
          );
        }).toList(),
      ),
    );
  }
}