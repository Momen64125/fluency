
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../controller/notifications_controller.dart';
import '../widgets/notification_tile.dart';
import '../widgets/section_header.dart';


class NotificationsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsyncValue = ref.watch(notificationsProvider);

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            radius: 1.r*30,
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF662D91)),
              onPressed: () {},
            ),
          ),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
          actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Color(0xFF662D91),
              borderRadius: BorderRadius.circular(1.r*20),
            ),
            child: const Text(
              "2 New",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
        ],


      ),
      body: notificationsAsyncValue.when(
        data: (notifications) {
          final todayNotifications = notifications["today"]!;
          final yesterdayNotifications = notifications["yesterday"]!;

          final hasNotifications = todayNotifications.isNotEmpty ||
              yesterdayNotifications.isNotEmpty;

          if (!hasNotifications) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/no_notifications.svg',
                    width: 1.sw*0.5,
                    height: 1.sh*0.3,

                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "No Notifications",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Notification Inbox Empty",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                if (todayNotifications.isNotEmpty) ...[
                  SectionHeader(
                    title: "Today",
                    onMarkAllRead: () {},
                  ),
                  ...todayNotifications.map((notification) {
                    return NotificationTile(
                      title: notification.title,
                      subtitle: notification.subtitle,
                      time: notification.time,
                      icon: notification.icon,
                    );
                  }).toList(),
                ],
                if (yesterdayNotifications.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  SectionHeader(
                    title: "Yesterday",
                    onMarkAllRead: () {},
                  ),
                  ...yesterdayNotifications.map((notification) {
                    return NotificationTile(
                      title: notification.title,
                      subtitle: notification.subtitle,
                      time: notification.time,
                      icon: notification.icon,
                    );
                  }).toList(),
                ],
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text("Error: $error"),
        ),
      ),
    );
  }
}
