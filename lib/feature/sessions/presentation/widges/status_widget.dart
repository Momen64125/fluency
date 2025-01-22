import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final String status;

  StatusWidget({required this.status});
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Ongoing':
        return Colors.blue;
      case 'Done':
        return Color(0xFF50CD89);
      case 'Schedule':
        return Color(0xFFF6C000);
      case 'Cancelled'||'Teacher did not show up':
        return Color(0xFFF1416C);
      default:
        return Colors.grey; // اللون الافتراضي
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
         width: 60,
         height: 20,

      decoration: BoxDecoration(
        color: _getStatusColor(status).withOpacity(0.2),
        border: Border.all(color: _getStatusColor(status)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          status,
          style: TextStyle(
            fontSize: 11,
            color: _getStatusColor(status),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
