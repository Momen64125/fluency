import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/notification_repository_impl.dart';
import '../../domain/entites/notification_entity.dart';
import '../../domain/repository/notification_repository.dart';
import '../../domain/usecase/notifications_use_case.dart';


final notificationRepositoryProvider = Provider<NotificationRepository>(
      (ref) => NotificationRepositoryImpl(),
);

final getNotificationsUseCaseProvider = Provider<GetNotificationsUseCase>(
      (ref) => GetNotificationsUseCase(ref.read(notificationRepositoryProvider)),
);

final notificationsProvider =
FutureProvider<Map<String, List<NotificationEntity>>>((ref) async {
  final useCase = ref.read(getNotificationsUseCaseProvider);
  return useCase.execute();
});
