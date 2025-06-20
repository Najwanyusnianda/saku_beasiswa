import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';

class OverviewTab extends ConsumerWidget {
  final int applicationId;
  const OverviewTab({super.key, required this.applicationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the family provider, passing in the application ID
    final applicationAsync = ref.watch(applicationDetailProvider(applicationId));
    final textTheme = Theme.of(context).textTheme;
    final completionAsync = ref.watch(applicationCompletionPercentageProvider(applicationId));
    return applicationAsync.when(
      data: (appWithTemplate) {
        final daysLeft = appWithTemplate.application.deadline.difference(DateTime.now()).inDays;

        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            // --- Progress Visualization Card ---
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Overall Progress', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    // Use the `when` of the completion provider here
                    completionAsync.when(
                      data: (completion) => Column(
                        children: [
                          LinearPercentIndicator(
                            lineHeight: 12.0,
                            percent: completion,
                            backgroundColor: AppColors.outline,
                            progressColor: AppColors.success,
                            barRadius: const Radius.circular(6),
                            animation: true,
                            animationDuration: 1000,
                            padding: EdgeInsets.zero,
                          ),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${(completion * 100).toInt()}% Complete',
                              style: textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.success,
                              ),
                            ),
                          ),
                        ],
                      ),
                      loading: () => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Center(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      ),
                      error: (error, stack) => Text(
                        'Could not load progress',
                        style: textTheme.bodySmall?.copyWith(color: AppColors.error),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // --- Key Dates Timeline Card ---
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Key Dates', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    _buildDateRow(
                      icon: Iconsax.calendar_add,
                      title: 'Application Started',
                      date: appWithTemplate.application.createdAt,
                      color: AppColors.textSecondary,
                    ),
                    const Divider(height: 24),
                    _buildDateRow(
                      icon: Iconsax.calendar_tick,
                      title: 'Application Deadline',
                      date: appWithTemplate.application.deadline,
                      color: AppColors.warning,
                      subtitle: '$daysLeft days remaining',
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: ${err.toString()}')),
    );
  }

  Widget _buildDateRow({
    required IconData icon,
    required String title,
    required DateTime date,
    required Color color,
    String? subtitle,
  }) {
    return Row(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
            Text(DateFormat.yMMMMd().add_jm().format(date)),
            if (subtitle != null) ...[
              const SizedBox(height: 2),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.warning)),
            ]
          ],
        ),
      ],
    );
  }
}
