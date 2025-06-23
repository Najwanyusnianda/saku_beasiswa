// // lib/features/applications/presentation/widgets/timeline_tab.dart

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';
// import 'package:saku_beasiswa/core/constants/app_colors.dart';
// import 'package:saku_beasiswa/features/applications/domain/timeline_event.dart';
// import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';
// import 'package:timeline_tile/timeline_tile.dart';

// class TimelineTab extends ConsumerWidget {
//   final int applicationId;
//   const TimelineTab({super.key, required this.applicationId});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final timelineAsync = ref.watch(applicationTimelineProvider(applicationId));

//     return timelineAsync.when(
//       data: (events) {
//         if (events.isEmpty) {
//           return const Center(child: Text('No timeline events available.'));
//         }
//         return ListView.builder(
//           padding: const EdgeInsets.all(24),
//           itemCount: events.length,
//           itemBuilder: (context, index) {
//             final event = events[index];
//             return TimelineTile(
//               alignment: TimelineAlign.manual,
//               lineXY: 0.25, // Position the line on the left
//               isFirst: index == 0,
//               isLast: index == events.length - 1,
//               // Style the indicator (the circle on the timeline)
//               indicatorStyle: IndicatorStyle(
//                 width: 40,
//                 height: 40,
//                 indicator: Container(
//                   decoration: BoxDecoration(
//                     color: event.isCompleted ? AppColors.success.withOpacity(0.2) : AppColors.warning.withOpacity(0.2),
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     event.isCompleted ? Icons.check_circle : event.icon,
//                     color: event.isCompleted ? AppColors.success : AppColors.warning,
//                     size: 20,
//                   ),
//                 ),
//               ),
//               // Style the line before and after the indicator
//               beforeLineStyle: const LineStyle(color: AppColors.outline, thickness: 2),
//               afterLineStyle: const LineStyle(color: AppColors.outline, thickness: 2),
//               // The content of the timeline event
//               endChild: Padding(
//                 padding: const EdgeInsets.only(left: 16, top: 8, bottom: 24),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       DateFormat.yMMMd().format(event.date),
//                       style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       event.title,
//                       style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                         fontWeight: FontWeight.bold,
//                         decoration: event.isCompleted && event.type == TimelineEventType.task
//                             ? TextDecoration.lineThrough
//                             : TextDecoration.none,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//       loading: () => const Center(child: CircularProgressIndicator()),
//       error: (err, stack) => Center(child: Text('Error: ${err.toString()}')),
//     );
//   }
// }
