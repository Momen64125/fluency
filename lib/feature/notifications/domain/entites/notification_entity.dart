import 'package:flutter/cupertino.dart';

class NotificationEntity {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;

  NotificationEntity({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
  });
}
