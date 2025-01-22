//
// import 'package:flutter/material.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;
//
//   // الشاشات الخاصة بالتنقل
//   final List<Widget> _screens = [
//     NotificationsPage(),
//     Center(child: Text('Sessions Screen', style: TextStyle(fontSize: 24))),
//     Center(child: Text('Add New Screen', style: TextStyle(fontSize: 24))),
//     Center(child: Text('Teachers Screen', style: TextStyle(fontSize: 24))),
//     Center(child: Text('Profile Screen', style: TextStyle(fontSize: 24))),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         selectedItemColor: Colors.purple,
//         unselectedItemColor: Colors.grey,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.calendar_today), label: "Sessions"),
//           BottomNavigationBarItem(
//             icon: Container(
//               height: 60,
//               width: 60,
//               decoration: BoxDecoration(
//                 color: Colors.purple,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(Icons.add, color: Colors.white, size: 30),
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Teachers"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle), label: "Profile"),
//         ],
//       ),
//     );
//   }
// }
//
// // تصميم شاشة الإشعارات (الشاشة الأولى)
// class NotificationsPage extends StatelessWidget {
//   final List<Map<String, dynamic>> todayNotifications = [
//     {
//       "title": "New course arrival",
//       "subtitle": "Lorem ipsum dolor sit amet, consectetur adipiscing...",
//       "time": "1h",
//       "icon": Icons.school,
//     },
//     {
//       "title": "Certificate available",
//       "subtitle": "Lorem ipsum dolor sit amet, consectetur adipiscing...",
//       "time": "1h",
//       "icon": Icons.verified,
//     },
//   ];
//
//   final List<Map<String, dynamic>> yesterdayNotifications = [
//     {
//       "title": "New course arrival",
//       "subtitle": "Lorem ipsum dolor sit amet, consectetur adipiscing...",
//       "time": "1d",
//       "icon": Icons.school,
//     },
//     {
//       "title": "Certificate available",
//       "subtitle": "Lorem ipsum dolor sit amet, consectetur adipiscing...",
//       "time": "1d",
//       "icon": Icons.verified,
//     },
//     {
//       "title": "Certificate available",
//       "subtitle": "Lorem ipsum dolor sit amet, consectetur adipiscing...",
//       "time": "1d",
//       "icon": Icons.verified,
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
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
//         actions: [
//           Container(
//             margin: const EdgeInsets.only(right: 16),
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//             decoration: BoxDecoration(
//               color: Colors.purple[100],
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: const Text(
//               "2 New",
//               style: TextStyle(
//                   color: Colors.purple, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             SectionHeader(
//               title: "Today",
//               onMarkAllRead: () {},
//             ),
//             ...todayNotifications.map((notification) {
//               return NotificationTile(
//                 title: notification["title"],
//                 subtitle: notification["subtitle"],
//                 time: notification["time"],
//                 icon: notification["icon"],
//               );
//             }).toList(),
//             const SizedBox(height: 16),
//             SectionHeader(
//               title: "Yesterday",
//               onMarkAllRead: () {},
//             ),
//             ...yesterdayNotifications.map((notification) {
//               return NotificationTile(
//                 title: notification["title"],
//                 subtitle: notification["subtitle"],
//                 time: notification["time"],
//                 icon: notification["icon"],
//               );
//             }).toList(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // قسم عنوان
// class SectionHeader extends StatelessWidget {
//   final String title;
//   final VoidCallback onMarkAllRead;
//
//   const SectionHeader({
//     Key? key,
//     required this.title,
//     required this.onMarkAllRead,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         TextButton(
//           onPressed: onMarkAllRead,
//           child: const Text("Mark all as read"),
//         ),
//       ],
//     );
//   }
// }
//
// // عنصر الإشعار
// class NotificationTile extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String time;
//   final IconData icon;
//
//   const NotificationTile({
//     Key? key,
//     required this.title,
//     required this.subtitle,
//     required this.time,
//     required this.icon,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: CircleAvatar(
//         backgroundColor: Colors.purple[50],
//         child: Icon(icon, color: Colors.purple),
//       ),
//       title: Text(
//         title,
//         style: const TextStyle(fontWeight: FontWeight.bold),
//       ),
//       subtitle: Text(subtitle),
//       trailing: Text(time),
//     );
//   }
// // }
// import 'package:flutter/material.dart';
//
// import '../notifications/presentation/screens/profile_screen.dart';
//  // استيراد شاشة الإشعارات
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;
//
//   final List<Widget> _screens = [
//     NotificationsPage(), // شاشة الإشعارات
//     Center(child: Text('Sessions Screen', style: TextStyle(fontSize: 24))),
//     Center(child: Text('Add New Screen', style: TextStyle(fontSize: 24))),
//     Center(child: Text('Teachers Screen', style: TextStyle(fontSize: 24))),
//     Center(child: Text('Profile Screen', style: TextStyle(fontSize: 24))),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_currentIndex],
//
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: const Icon(Icons.add),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomNavigationBar(
//
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         selectedItemColor: Colors.purple,
//         unselectedItemColor: Colors.grey,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Sessions"),
//
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Teachers"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle), label: "Profile"),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../notifications/presentation/screens/notifications_screen.dart';
import '../profile/presentation/screens/profile_screen.dart';
import '../sessions/presentation/screens/sessions.dart';
import '../teachers/presentation/screens/teachers_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    NotificationsPage(),
    SessionsScreen(),
    const Center(child: Text('Add New Screen', style:  TextStyle(fontSize: 24))),
    const Center(child: Text('Teachers Screen', style: TextStyle(fontSize: 24))),
   // TeachersScreen(),
    ProfileScreen(),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],

      // الزر العائم
      floatingActionButton: CircleAvatar(
        radius: 30,
        child: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: (){}, child: const Icon(Icons.add),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // شريط التنقل السفلي
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 15.0,
        child: SizedBox(
          height: 60, // ارتفاع الشريط السفلي
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home,
                label: 'Home',
                index: 0,
              ),
              _buildNavItem(
                icon: Icons.video_camera_front_outlined,
                label: 'Sessions',
                index: 1,
              ),
              const SizedBox(width: 40), // مكان الزر العائم
              _buildNavItem(
                icon: Icons.people_alt_outlined,
                label: 'Teachers',
                index: 3,
              ),
              _buildNavItem(
                icon: Icons.person_outline_outlined,
                label: 'Profile',
                index: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      {
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Color(0xFF662D91) : Color(0xFF9983A7),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Color(0xFF662D91) : Color(0xFF9983A7),
            ),
          ),

        ],
      ),
    );
  }
}
