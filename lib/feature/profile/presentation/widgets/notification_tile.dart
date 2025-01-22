
import 'package:flutter/material.dart';

class NotificationTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;

  const NotificationTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
  }) : super(key: key);

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(

      //tileColor: _isTapped ? Colors.grey.shade200 : Colors.white,
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey.shade200,
        child: Icon(widget.icon, color: const Color(0xFF662D91)),
      ),
      title: Text(
        widget.title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      subtitle: Text(
        widget.subtitle,
        style: const TextStyle(fontSize: 12, color:  Color(0xff977777)),
      ),
      trailing: Text(widget.time),
      onTap: () {
        if (!_isTapped) {
          setState(() {
            _isTapped = true;
          });
        }
      },
    );
  }
}
