// import 'package:flutter/material.dart';
//
// import '../../domain/entites/notification_entity.dart';
//
// class NotificationModel {
//   final String title;
//   final String subtitle;
//   final String time;
//   final String iconName;
//
//   NotificationModel({
//     required this.title,
//     required this.subtitle,
//     required this.time,
//     required this.iconName,
//   });
//
//   // تحويل من JSON إلى Model
//   factory NotificationModel.fromJson(Map<String, dynamic> json) {
//     return NotificationModel(
//       title: json['title'],
//       subtitle: json['subtitle'],
//       time: json['time'],
//       iconName: json['iconName'],
//     );
//   }
//
//   // تحويل من Model إلى Entity
//   NotificationEntity toEntity() {
//     return NotificationEntity(
//       title: title,
//       subtitle: subtitle,
//       time: time,
//       icon: _getIconFromName(iconName),
//     );
//   }
//
//   // دالة لتحويل اسم الأيقونة إلى أيقونة
//   IconData _getIconFromName(String name) {
//     switch (name) {
//       case 'school':
//         return Icons.school;
//       case 'verified':
//         return Icons.verified;
//       default:
//         return Icons.notifications;
//     }
//   }
// }
