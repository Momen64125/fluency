import '../entites/notification_entity.dart';
import '../repository/notification_repository.dart';

class GetNotificationsUseCase {
  final NotificationRepository repository;

  GetNotificationsUseCase(this.repository);

  Future<Map<String, List<NotificationEntity>>> execute() async {
    final todayNotifications = await repository.getTodayNotifications();
    final yesterdayNotifications = await repository.getYesterdayNotifications();

    return {
      "today": todayNotifications,
      "yesterday": yesterdayNotifications,
    };
  }
}
