import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
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
    final daysLeft = item.application.deadline.difference(DateTime.now()).inDays;

    // Watch the new provider, passing in the application ID
    final completionAsync = ref.watch(applicationCompletionPercentageProvider(item.application.id));


    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias, // Ensures the inkwell ripple respects the border radius
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.outline,
                    child: const Icon(Iconsax.award, color: AppColors.textSecondary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.template.name, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                        Text(item.template.providerName, style: textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Deadline', style: textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
                  Text(
                    '${DateFormat.yMMMd().format(item.application.deadline)} ($daysLeft days left)',
                    style: textTheme.bodySmall?.copyWith(color: AppColors.warning, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: completionAsync.when(
                      data: (completion) => LinearPercentIndicator(
                        lineHeight: 8.0,
                        percent: completion,
                        backgroundColor: AppColors.outline,
                        progressColor: AppColors.success,
                        barRadius: const Radius.circular(4),
                        animation: true,
                      ),
                      loading: () => const SizedBox(
                        height: 8,
                        child: Center(
                          child: LinearProgressIndicator(),
                        ),
                      ),
                      error: (_, __) => const SizedBox.shrink(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  completionAsync.when(
                    data: (completion) => Text(
                      '${(completion * 100).toInt()}%',
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.success,
                      ),
                    ),
                    loading: () => const SizedBox.shrink(),
                    error: (_, __) => const SizedBox.shrink(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
