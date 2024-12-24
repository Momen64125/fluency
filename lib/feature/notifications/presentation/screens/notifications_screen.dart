
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../widgets/notification_tile.dart';
// import '../widgets/section_header.dart';
//
//
// class NotificationsPage extends StatelessWidget {
//   final List<Map<String, dynamic>> todayNotifications = [
//     // {
//     //   "title": "New course arrival",
//     //   "subtitle": "Lorem ipsum dolor sit amet, consectetur adipiscing...",
//     //   "time": "1h",
//     //   "icon": Icons.school,
//     // },
//   ];
//
//   final List<Map<String, dynamic>> yesterdayNotifications = [];
//
//   @override
//   Widget build(BuildContext context) {
//     // تحقق من وجود إشعارات
//     final hasNotifications =
//         todayNotifications.isNotEmpty || yesterdayNotifications.isNotEmpty;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {},
//         ),
//         title: const Text(
//           "Notifications",
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: false,
//
//           actions: [
//           Container(
//             margin: const EdgeInsets.only(right: 16),
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//             decoration: BoxDecoration(
//               color: Color(0xFF662D91),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: const Text(
//               "2 New",
//               style: TextStyle(
//                   color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//
//
//
//       body: hasNotifications
//           ? Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ListView(
//           children: [
//             if (todayNotifications.isNotEmpty) ...[
//               SectionHeader(
//                 title: "Today",
//                 onMarkAllRead: () {},
//               ),
//               ...todayNotifications.map((notification) {
//                 return NotificationTile(
//                   title: notification["title"],
//                   subtitle: notification["subtitle"],
//                   time: notification["time"],
//                   icon: notification["icon"],
//                 );
//               }).toList(),
//             ],
//             if (yesterdayNotifications.isNotEmpty) ...[
//               const SizedBox(height: 16),
//               SectionHeader(
//                 title: "Yesterday",
//                 onMarkAllRead: () {},
//               ),
//               ...yesterdayNotifications.map((notification) {
//                 return NotificationTile(
//                   title: notification["title"],
//                   subtitle: notification["subtitle"],
//                   time: notification["time"],
//                   icon: notification["icon"],
//                 );
//               }).toList(),
//             ],
//           ],
//         ),
//       )
//           : Center(
//              child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//               SvgPicture.asset(
//               'assets/images/splash.svg',
//               width: 300,
//               height: 300,
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               "No Notifications",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey,
//               ),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               "You're all caught up!",
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF662D91)),
            onPressed: () {},
          ),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
          actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Color(0xFF662D91),
              borderRadius: BorderRadius.circular(20),
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
                    height: 200,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "No Notifications",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "You're all caught up!",
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
