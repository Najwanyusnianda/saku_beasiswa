// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:saku_beasiswa/core/database/app_database.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// part 'notification_service.g.dart';

// class NotificationService {
//   final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> init() async {
//     // --- Initialization Settings ---
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     final DarwinInitializationSettings initializationSettingsDarwin =
//         const DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//     );

//     final InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsDarwin,
//     );

//     // --- Initialize Timezones ---
//     tz.initializeTimeZones();
//     // You might need to set the local location depending on your target audience
//     // tz.setLocalLocation(tz.getLocation('Asia/Jakarta'));


//     await _notificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (details) async {
//         // Handle notification tapped logic here
//       },
//     );

//     // --- Request Permissions (Android 13+) ---
//     final androidImplementation = _notificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
//     if (androidImplementation != null) {
//       await androidImplementation.requestNotificationsPermission();
//       await androidImplementation.requestExactAlarmsPermission();
//     }
//   }

//   Future<void> scheduleDeadlineReminders(Application application) async {
//     final deadline = application.deadline;
//     final db = ref.read(appDatabaseProvider);
//     final appName = (await (db.select(db.scholarshipTemplates)
//           ..where((tbl) => tbl.id.equals(application.templateId)))
//         .getSingle())
//         .name;

//     // Add a 10-second reminder for testing
//     final testNotificationDate = DateTime.now().add(const Duration(seconds: 10));
//     await _scheduleNotification(
//       id: 9999, // A unique test ID
//       title: 'Test: $appName',
//       body: 'This is a test notification!',
//       scheduledDate: testNotificationDate,
//     );
    
//     final reminderIntervals = [30, 14, 7, 1];

//     for (int daysBefore in reminderIntervals) {
//       final notificationDate = deadline.subtract(Duration(days: daysBefore));
      
//       // Only schedule notifications that are in the future
//       if (notificationDate.isAfter(DateTime.now())) {
//         // We need a unique ID for each scheduled notification.
//         // We can create one by combining the application ID and the daysBefore.
//         // Example: App ID 1, 30 days before -> ID 130
//         // This is a simple but effective strategy.
//         final notificationId = int.parse('${application.id}$daysBefore');
        
//         await _scheduleNotification(
//           id: notificationId,
//           title: 'Deadline Reminder: $appName',
//           body: 'Your application deadline is in $daysBefore days! Keep up the great work.',
//           scheduledDate: notificationDate,
//         );
//       }
//     }
//   }
  
//   Future<void> cancelDeadlineReminders(int applicationId) async {
//     final reminderIntervals = [30, 14, 7, 1];
//     for (int daysBefore in reminderIntervals) {
//       final notificationId = int.parse('$applicationId$daysBefore');
//       await _notificationsPlugin.cancel(notificationId);
//     }
//   }

//   Future<void> _scheduleNotification({
//     required int id,
//     required String title,
//     required String body,
//     required DateTime scheduledDate,
//   }) async {
//     await _notificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       tz.TZDateTime.from(scheduledDate, tz.local),
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'deadline_reminders',
//           'Deadline Reminders',
//           channelDescription:
//               'Notifications for upcoming scholarship deadlines.',
//           importance: Importance.max,
//           priority: Priority.high,
//         ),
//         iOS: DarwinNotificationDetails(),
//       ),
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//     );
//   }
// }

// // Create a singleton provider for our service
// @Riverpod(keepAlive: true)
// NotificationService notificationService(Ref ref) {
//   // We attach the ref to the class instance to allow it to read other providers.
//   // This is a bit of a workaround for using a class-based service with Riverpod.
//   return NotificationService()..ref = ref;
// }

// // Extension to attach ref
// extension on NotificationService {
//   static final Expando<Ref> _ref = Expando();
//   Ref get ref => _ref[this]!;
//   set ref(Ref ref) => _ref[this] = ref;
// }
