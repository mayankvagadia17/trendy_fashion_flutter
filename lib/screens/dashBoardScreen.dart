import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../helper/Color.dart';
import '../widget/BannerItem.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
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
                        child: Icon(
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
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 0.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: primaryBrown,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: primaryBrown,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: primaryBrown,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: primaryBrown,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        child: Icon(
                          Icons.tune,
                          color: Colors.white,
                          size: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: primaryBrown,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 0.0),
                child: SizedBox(
                  height: 175, // Height of the banner
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
              ),
              SizedBox(height: 10),
              SmoothPageIndicator(
                controller: _pageController,
                count: banners.length,
                effect: ScrollingDotsEffect(
                  activeDotColor: Colors.brown,
                  dotColor: Colors.grey,
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 5,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 14,
                        color: primaryBrown,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Flash Sale',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
