import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';

class ApplicationListItem extends ConsumerWidget {
  final ApplicationWithTemplate item;
  final VoidCallback onTap;

  const ApplicationListItem({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final applicationId = item.application.id;

    // Watch semua provider yang kita butuhkan
    final completionAsync = ref.watch(applicationCompletionPercentageProvider(applicationId));
    final nextTaskAsync = ref.watch(nextUpcomingTaskProvider(applicationId));
    // --- WATCH PROVIDER STATUS YANG BARU ---
    final status = ref.watch(applicationStatusProvider(applicationId));

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Bagian Header ---
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    child: const Icon(Iconsax.award, color: AppColors.primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.application.customName ?? item.template.name,
                          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          item.template.providerName,
                          style: textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // --- Bagian Progress Bar ---
              completionAsync.when(
                data: (completion) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LinearPercentIndicator(
                      lineHeight: 6.0,
                      percent: completion,
                      padding: EdgeInsets.zero,
                      barRadius: const Radius.circular(3),
                      backgroundColor: AppColors.outline,
                      progressColor: AppColors.success,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${(completion * 100).toInt()}% complete',
                      style: textTheme.bodySmall,
                    )
                  ],
                ),
                loading: () => const SizedBox(height: 10),
                error: (_, __) => const SizedBox.shrink(),
              ),
              const Divider(height: 24),

              // --- Bagian Tugas Berikutnya & Status ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // --- Next Task ---
                  Expanded(
                    child: nextTaskAsync.when(
                      data: (task) {
                        if (task == null || task.dueDate == null) {
                          return const Text('All tasks done!', style: TextStyle(color: AppColors.success));
                        }
                        final daysLeft = task.dueDate!.difference(DateTime.now()).inDays;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('NEXT:', style: textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
                            Text(
                              task.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              daysLeft > 0 ? 'in $daysLeft days' : 'Today',
                              style: textTheme.bodySmall?.copyWith(color: AppColors.warning),
                            ),
                          ],
                        );
                      },
                      loading: () => const SizedBox(),
                      error: (_, __) => const Text('Error loading task'),
                    ),
                  ),
                  // --- LENCANA STATUS DINAMIS ---
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: status.color.withValues(alpha: 0.1), // Gunakan warna dari enum
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      status.label, // Gunakan label dari enum
                      style: TextStyle(
                        color: status.color, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}