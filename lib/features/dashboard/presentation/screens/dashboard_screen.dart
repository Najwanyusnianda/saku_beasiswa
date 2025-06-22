import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/features/dashboard/presentation/widgets/status_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    // Watch semua provider yang kita butuhkan
    final activeAppsCount = ref.watch(activeApplicationsCountProvider);
    final overdueCount = ref.watch(overdueTasksCountProvider);
    final nextDeadlineAsync = ref.watch(nextDeadlineProvider);
    final focusTasksAsync = ref.watch(todaysFocusProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back, Pejuang!', style: textTheme.bodyMedium),
            Text('Your Dashboard', style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [ /* ... (actions tidak berubah) ... */ ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          // --- Status Overview Section ---
          Row(
            children: [
              activeAppsCount.when(
                data: (count) => StatusCard(title: 'Active Apps', value: count.toString(), icon: Iconsax.document_text_1, color: AppColors.primary),
                loading: () => const Expanded(child: Center(child: CircularProgressIndicator())),
                error: (err, st) => const StatusCard(title: 'Error', value: '!', icon: Iconsax.danger, color: AppColors.error),
              ),
              const SizedBox(width: 16),
              nextDeadlineAsync.when(
                data: (app) {
                  final daysLeft = app?.deadline.difference(DateTime.now()).inDays;
                  return StatusCard(title: 'Next Deadline', value: daysLeft != null ? '$daysLeft Days' : '-', icon: Iconsax.calendar_1, color: AppColors.warning);
                },
                loading: () => const Expanded(child: Center(child: CircularProgressIndicator())),
                error: (err, st) => const StatusCard(title: 'Error', value: '!', icon: Iconsax.danger, color: AppColors.error),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // --- Kartu Overdue ---
          overdueCount.when(
            data: (count) => count > 0 
                ? StatusCard(title: 'Overdue Tasks', value: count.toString(), icon: Iconsax.danger, color: AppColors.error)
                : const SizedBox.shrink(),
            loading: () => const SizedBox.shrink(),
            error: (err, st) => const SizedBox.shrink(),
          ),
          const SizedBox(height: 32),

          // --- Today's Focus Section (diperbarui) ---
          Text("Today's Focus", style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          focusTasksAsync.when(
            data: (tasks) {
              if (tasks.isEmpty) {
                return const Card(child: ListTile(leading: Icon(Iconsax.coffee, color: AppColors.success), title: Text("All clear!"), subtitle: Text("No urgent tasks for now.")));
              }
              return Column(
                children: tasks.map((taskWithInfo) {
                  final task = taskWithInfo.task;
                  final template = taskWithInfo.template;
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: const Icon(Iconsax.edit, color: AppColors.primary),
                      title: Text(task.title),
                      subtitle: Text(
                        'For: ${template.name}\nDue: ${DateFormat.yMMMd().format(task.dueDate!)}',
                      ),
                      trailing: Checkbox(value: task.status == 'completed', onChanged: (v) {
                        ref.read(applicationRepositoryProvider).updateTaskStatus(task.id, v ?? false);
                      }),
                    ),
                  );
                }).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, st) => Text('Could not load tasks: $err'),
          ),

          const SizedBox(height: 32),

          // --- Shortcut Cards (Placeholder) ---
          Text('Shortcuts', style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const Card(
            child: ListTile(
              leading: Icon(Iconsax.calendar, color: AppColors.textSecondary),
              title: Text('View Full Calendar'),
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16),
            ),
          )
        ],
      ),
    );
  }
}