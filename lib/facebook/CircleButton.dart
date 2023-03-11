import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Function onPressed;
  final Color bgColor;
  const CircleButton({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.bgColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      // decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: IconButton(
        onPressed: () {
          onPressed();
        },
        icon: Icon(icon),
        color: Colors.black,
        iconSize: iconSize,
      ),
    );
  }
}
