import 'dart:async';
import 'package:flutter/material.dart';
import '../../domain/entites/notification_entity.dart';
import '../../domain/repository/notification_repository.dart';


class NotificationRepositoryImpl implements NotificationRepository {
  @override
  Future<List<NotificationEntity>> getTodayNotifications() async {
    // محاكاة استدعاء API
    await Future.delayed(const Duration(seconds: 1));
    return [
      NotificationEntity(
        title: "New course arrival",
        subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing...",
        time: "1h",
        icon: Icons.school,
      ),
    ];
  }

  @override
  Future<List<NotificationEntity>> getYesterdayNotifications() async {
    // محاكاة استدعاء API
    await Future.delayed(const Duration(seconds: 1));
    return [
      NotificationEntity(
        title: "New course arrival",
        subtitle: "Dorem ipsum dolor sit amet, consectetur adipiscing et velit interdum, ac aliquet odio mattis.",
        time: "1d",
        icon: Icons.school,
      ),
      NotificationEntity(
        title: "Certificate available",
        subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing...",
        time: "1d",
        icon: Icons.verified,
      ),
    ];
  }
}
