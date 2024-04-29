// import 'package:flutter/material.dart';
// import 'package:timer/timer.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class ReminderService {
//   final Timer _timer;
//   final FlutterLocalNotificationsPlugin _notifications;

//   ReminderService()
//       : _timer = Timer.periodic(Duration(days: 1), (timer) {
//           // Schedule reminders here
//         }),
//         _notifications = FlutterLocalNotificationsPlugin();

//   void scheduleReminders(List<Reminder> reminders) {
//     for (var reminder in reminders) {
//       _timer.schedule(Duration(days: 1), () {
//         _showNotification(reminder);
//       });
//     }
//   }

//   void _showNotification(Reminder reminder) {
//     _notifications.show(
//       0,
//       'Medication Reminder',
//       'Take your ${reminder.medicationName}!',
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           'channelId',
//           'channelName',
//           'channelDescription',
//         ),
//       ),
//     );
//   }
// }

// class Reminder {
//   String medicationName;
//   DateTime startDate;
//   DateTime endDate;
//   TimeOfDay dailyTime;
//   String description;

//   Reminder({
//     required this.medicationName,
//     required this.startDate,
//     required this.endDate,
//     required this.dailyTime,
//     required this.description,
//   });
// }
