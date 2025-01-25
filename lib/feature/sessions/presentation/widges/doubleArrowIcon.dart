import 'package:flutter/material.dart';

class DoubleArrowIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.keyboard_arrow_down,
          size: 30,
          color: Colors.grey,
        ),
        Positioned(
          top: 6,
          child: Icon(
            Icons.keyboard_arrow_down,
            size: 30,

            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
