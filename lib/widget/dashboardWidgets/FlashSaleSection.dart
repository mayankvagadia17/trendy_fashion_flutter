import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helper/Color.dart';
import 'TimerBox.dart';

class FlashSaleSection extends StatelessWidget {
  const FlashSaleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 16.0, vertical: 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Flash Sale',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Closing in : ",
                  style: TextStyle(
                      fontSize: 14, color: greyText)),
              Timerbox(title: "02"),
              Text(" : ",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
              Timerbox(title: "12"),
              Text(" : ",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
              Timerbox(title: "56"),
            ],
          ),
        ],
      ),
    );
  }
}
