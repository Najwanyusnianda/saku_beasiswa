import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/customise_wizard_provider.dart';

class WizardStep2Tasks extends ConsumerWidget {
  final CustomiseWizardState wizardState;
  final String templateId;
  
  const WizardStep2Tasks({
    super.key, 
    required this.wizardState, 
    required this.templateId
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final allTasks = wizardState.fullTemplate.tasks;
    final selectedTasks = wizardState.customizedTasks;

    return ReorderableListView(
      padding: const EdgeInsets.all(24),
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Step 2: Select Your Tasks', 
            style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 8),
          const Text(
            'Toggle any optional tasks you want to include and drag to reorder. Mandatory tasks cannot be removed.'
          ),
          const SizedBox(height: 16),
        ],
      ),
      onReorder: (oldIndex, newIndex) {
        ref.read(customiseWizardProvider(templateId).notifier)
            .reorderTasks(oldIndex, newIndex);
      },
      children: [
        for (final task in selectedTasks)
          SwitchListTile(
            key: ValueKey(task.id),
            title: Text(task.label),
            value: true,
            onChanged: task.isMandatory
                ? null
                : (bool isIncluded) {
                    ref.read(customiseWizardProvider(templateId).notifier)
                        .toggleTask(task, isIncluded);
                  },
            secondary: ReorderableDragStartListener(
              index: selectedTasks.indexOf(task),
              child: const Icon(Iconsax.menu_1),
            ),
          ),
        
        // Show toggled-off tasks with strikethrough
        const Divider(),
        ...allTasks
            .where((task) => !selectedTasks.any((t) => t.id == task.id))
            .map((task) => SwitchListTile(
                  key: ValueKey('off-${task.id}'),
                  title: Text(
                    task.label,
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                  value: false,
                  onChanged: (bool isIncluded) {
                    ref.read(customiseWizardProvider(templateId).notifier)
                        .toggleTask(task, isIncluded);
                  },
                )),
      ],
    );
  }
}
