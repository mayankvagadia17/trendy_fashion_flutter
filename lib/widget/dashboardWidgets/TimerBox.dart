import 'package:flutter/material.dart';

import '../../helper/Color.dart';

class Timerbox extends StatelessWidget {
  final String? title;

  const Timerbox({
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: lightBrown,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title!,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryBrown),
      ),
    );
  }
}
