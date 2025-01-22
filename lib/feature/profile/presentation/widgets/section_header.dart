import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onMarkAllRead;

  const SectionHeader({
    Key? key,
    required this.title,
    required this.onMarkAllRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF9983A7)),
        ),
        TextButton(
          onPressed: onMarkAllRead,
          child: const Text("Mark all as read"),
        ),
      ],
    );
  }
}
