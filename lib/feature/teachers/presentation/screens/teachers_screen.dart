import 'package:flutter/material.dart';

import '../widgets/teacher_details_card.dart';
class TeachersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        toolbarHeight: 150,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(' assets/profile.jpg'), // ضع صورتك هنا
                  radius: 20,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mohamed",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "Free Account? Subscribe Now",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.notifications, color: Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "May 5, 2024",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.deepPurple,
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Teachers",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TeacherCard(
                    name: "Mohamed Helwani",
                    nationality: "Egypt",
                    accent: "American",
                    image: 'assets/images/Frame 1000006681.svg',
                    backgroundColor: Colors.deepPurple.shade100,
                  ),
                  TeacherCard(
                    name: "Jane Doe",
                    nationality: "USA",
                    accent: "British",
                    image: 'assets/teacher2.jpg',
                    backgroundColor: Colors.cyan.shade100,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


