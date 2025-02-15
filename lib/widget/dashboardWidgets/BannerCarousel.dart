import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../helper/Color.dart';
import 'BannerItem.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();

    final List<Map<String, String>> banners = [
      {
        "title": "New Collection",
        "subtitle": "Discount 50% for\nthe first transaction"
      },
      {
        "title": "Trending Styles",
        "subtitle": "Get the latest\nfashion trends now"
      },
      {
        "title": "Exclusive Offers",
        "subtitle": "Special deals for\nour loyal customers"
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          SizedBox(
            height: 175,
            child: PageView.builder(
              controller: _pageController,
              itemCount: banners.length,
              itemBuilder: (context, index) {
                return BannerItem(
                  title: banners[index]["title"]!,
                  subtitle: banners[index]["subtitle"]!,
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          SmoothPageIndicator(
            controller: _pageController,
            count: banners.length,
            effect: ScrollingDotsEffect(
              activeDotColor: primaryBrown,
              dotColor: categorylistviewbackgroundColor,
              dotHeight: 8,
              dotWidth: 8,
              spacing: 5,
            ),
          ),
        ],
      ),
    );
  }
}
