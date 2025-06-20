// lib/features/dashboard/presentation/screens/dashboard_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:saku_beasiswa/features/dashboard/presentation/widgets/status_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    // Watch our new providers
    final activeAppsCount = ref.watch(activeApplicationsCountProvider);
    final nextDeadline = ref.watch(nextDeadlineProvider);
    final focusTasks = ref.watch(todaysFocusTasksProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back, Pejuang!', style: textTheme.bodyMedium),
            Text('Your Dashboard', style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification)),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          // --- Status Overview Section ---
          Row(
            children: [
              // Active Applications Card
              activeAppsCount.when(
                data: (count) => StatusCard(
                  title: 'Active Applications',
                  value: count.toString(),
                  icon: Iconsax.document_text_1,
                  color: AppColors.primary,
                ),
                loading: () => const Expanded(child: Center(child: CircularProgressIndicator())),
                error: (err, st) => const StatusCard(title: 'Error', value: '!', icon: Iconsax.danger, color: AppColors.error),
              ),
              const SizedBox(width: 16),
              // Next Deadline Card
              nextDeadline.when(
                data: (app) {
                  String value;
                  if (app == null) {
                    value = '-';
                  } else {
                    final daysLeft = app.deadline.difference(DateTime.now()).inDays;
                    value = daysLeft > 0 ? '$daysLeft Days' : 'Today';
                  }
                  return StatusCard(
                    title: 'Next Deadline',
                    value: value,
                    icon: Iconsax.calendar_1,
                    color: AppColors.warning,
                  );
                },
                loading: () => const Expanded(child: Center(child: CircularProgressIndicator())),
                error: (err, st) => const StatusCard(title: 'Error', value: '!', icon: Iconsax.danger, color: AppColors.error),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // --- Today's Focus Section ---
          Text("Today's Focus", style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          focusTasks.when(
            data: (tasks) {
              if (tasks.isEmpty) {
                return const Card(
                  child: ListTile(
                    leading: Icon(Iconsax.coffee, color: AppColors.success),
                    title: Text("All clear!"),
                    subtitle: Text("No urgent tasks for now."),
                  ),
                );
              }
              return Column(
                children: tasks.map((task) => Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: const Icon(Iconsax.edit, color: AppColors.primary),
                    title: Text(task.title),
                    subtitle: Text('Due ${DateFormat.yMMMd().format(task.dueDate!)}'),
                    trailing: Checkbox(value: false, onChanged: (v) {
                      // TODO: Add logic to complete task
                    }),
                  ),
                )).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, st) => const Text('Could not load tasks '),
          ),

          const SizedBox(height: 32),

          // --- Smart Recommendations Section (still static) ---
          Text('Recommended For You', style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.outline,
                child: Icon(Iconsax.award, color: AppColors.textSecondary),
              ),
              title: Text('Chevening Scholarship'),
              subtitle: Text('Opens in 2 months'),
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16),
            ),
          )
        ],
      ),
    );
  }
}