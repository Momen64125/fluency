import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const TabItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Color(0xFF362E3C) : const Color(0xFFA9A9A9),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (isSelected)
            Container(

              width: 1.sw*0.4,
              height: 1.sh*0.01,

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF662D91), Color(0xFF905EB6)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),

                borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
              ) ,

            ),

        ],
      ),
    );
  }
}
