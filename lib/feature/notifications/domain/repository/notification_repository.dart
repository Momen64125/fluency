import '../entites/notification_entity.dart';

abstract class NotificationRepository {
  Future<List<NotificationEntity>> getTodayNotifications();
  Future<List<NotificationEntity>> getYesterdayNotifications();
}
