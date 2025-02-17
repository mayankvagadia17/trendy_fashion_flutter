import 'package:flutter/material.dart';
import 'package:trendy_fashion/helper/Color.dart';


class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0, vertical: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Location',
                style: TextStyle(
                  fontSize: 14,
                  color: greyText,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: primaryBrown,
                  ),
                  Text(
                    'New York, USA',
                    style: TextStyle(
                      fontSize: 15,
                      color: primaryBrown,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: primaryBrown,
                  ),
                ],
              )
            ],
          ),
          InkWell(
            child: Container(
              height: 35,
              width: 35,
              child: const Icon(
                Icons.notifications,
                color: Colors.black,
                size: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                color: Colors.grey.shade300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
