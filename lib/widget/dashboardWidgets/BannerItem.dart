import 'package:flutter/material.dart';
import 'package:trendy_fashion/helper/Color.dart';

class BannerItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const BannerItem({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            // Image.network(image,
            //     width: double.infinity, height: 200, fit: BoxFit.cover),
            Container(
              width: double.infinity,
              height: 175,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    bannerBackgroundColor.withOpacity(1.0),
                    bannerBackgroundColor.withOpacity(1.0)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(height: 5),
                  Text(subtitle,
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade800)),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child:
                        Text("Shop Now", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
