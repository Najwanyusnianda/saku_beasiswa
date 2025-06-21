import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/customise_wizard_provider.dart';

class WizardStep1Deadline extends ConsumerWidget {
  final CustomiseWizardState wizardState;
  final String templateId;
  const WizardStep1Deadline({super.key, required this.wizardState, required this.templateId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(
          'Step 1: Set Your Deadline',
          style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text('Set a target deadline for your application. All task dates will be calculated based on this.'),
        const SizedBox(height: 24),

        // --- Main Deadline Picker ---
        Card(
          child: ListTile(
            leading: const Icon(Iconsax.calendar_1, color: AppColors.primary),
            title: const Text('Main Application Deadline'),
            subtitle: Text(
              wizardState.mainDeadline == null
                ? 'Not set'
                : DateFormat.yMMMMd().format(wizardState.mainDeadline!),
              style: textTheme.titleMedium?.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Iconsax.arrow_down_1),
            onTap: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: wizardState.mainDeadline ?? DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
              );
              if (pickedDate != null) {
                ref.read(customiseWizardProvider(templateId).notifier).setMainDeadline(pickedDate);
              }
            },
          ),
        ),
        const Divider(height: 40),

        // --- Calculated Dates Preview ---
        Text(
          'Calculated Schedule Preview',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        if (wizardState.mainDeadline == null)
          const Center(
            child: Text('Set a main deadline to see the calculated schedule.', textAlign: TextAlign.center),
          )
        else
          ...wizardState.fullTemplate.tasks.map((task) {
            final dueDate = wizardState.mainDeadline!.add(Duration(days: task.offsetDays ?? 0));
            return ListTile(
              leading: const Icon(Iconsax.task_square, color: AppColors.textSecondary),
              title: Text(task.label),
              trailing: Text(DateFormat.yMMMd().format(dueDate), style: textTheme.bodySmall),
            );
          }),
      ],
    );
  }
}
