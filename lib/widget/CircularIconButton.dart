import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CircularIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: CircleBorder(),
        side: BorderSide(color: Colors.black, width: 1),
        padding: EdgeInsets.all(12), // Adjust padding for icon size
      ),
      child: Icon(
        icon,
        size: 30,
        color: Colors.black,
      ),
    );
  }
}