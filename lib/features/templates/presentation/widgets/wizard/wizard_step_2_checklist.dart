import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/customise_wizard_provider.dart';
import 'package:saku_beasiswa/features/templates/presentation/widgets/wizard/wizard_card.dart';

class WizardStep2Checklist extends ConsumerWidget {
  final String templateId;
  const WizardStep2Checklist({super.key, required this.templateId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wizardState = ref.watch(customiseWizardProvider(templateId)).value!;
    final notifier = ref.read(customiseWizardProvider(templateId).notifier);

    return WizardCard(
      step: 2,
      title: 'Adjust Your Checklist',
      child: ListView(
        shrinkWrap: true,
        children: [
          const Text(
            "Uncheck any tasks or documents you don't need.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          // --- Tasks Section ---
          if (wizardState.fullTemplate.tasks.isNotEmpty) ...[
            Text('Tasks', style: Theme.of(context).textTheme.titleMedium),
            ...wizardState.fullTemplate.tasks.map((task) => _buildTaskTile(task, wizardState, notifier)),
            const SizedBox(height: 16),
          ],
          // --- Documents Section ---
           if (wizardState.fullTemplate.documents.isNotEmpty) ...[
            Text('Documents', style: Theme.of(context).textTheme.titleMedium),
            ...wizardState.fullTemplate.documents.map((doc) => _buildDocTile(doc, wizardState, notifier)),
          ],
        ],
      ),
    );
  }

  Widget _buildTaskTile(TemplateTask task, CustomiseWizardState state, CustomiseWizard notifier) {
    return CheckboxListTile(
      title: Text(task.label),
      value: state.customizedTasks.any((t) => t.id == task.id),
      onChanged: (isChecked) => notifier.toggleTask(task, isChecked!),
      dense: true,
    );
  }

  Widget _buildDocTile(TemplateDocument doc, CustomiseWizardState state, CustomiseWizard notifier) {
    return CheckboxListTile(
      title: Text(doc.name),
      subtitle: doc.isOptional ? const Text('Optional') : null,
      value: state.customizedDocuments.any((d) => d.id == doc.id),
      onChanged: (isChecked) => notifier.toggleDocument(doc, isChecked!),
      dense: true,
    );
  }
}