import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trendy_fashion/screens/CartScreen.dart';
import 'package:trendy_fashion/screens/WishlistScreen.dart';
import 'package:trendy_fashion/screens/dashBoardScreen.dart';
import 'package:trendy_fashion/screens/profileScreen.dart';

import '../helper/Color.dart';
import '../widget/BannerItem.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  int _currentPage = 0;
  final ScrollController _scrollController = ScrollController();
  final List<Widget> _screens = [
    Dashboardscreen(),
    Cartscreen(),
    Wishlistscreen(),
    Dashboardscreen(),
    Profilescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: _currentPage,
          children: _screens,
        ),
        bottomNavigationBar: DotCurvedBottomNav(
          scrollController: _scrollController,
          hideOnScroll: false,
          indicatorColor: primaryBrown,
          backgroundColor: bottomNavigationColor,
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.ease,
          selectedIndex: _currentPage,
          indicatorSize: 5,
          borderRadius: 10,
          height: 60,
          onTap: (index) {
            setState(() => _currentPage = index);
          },
          items: [
            Icon(
              Icons.home_outlined,
              color: _currentPage == 0 ? primaryBrown : Colors.white,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: _currentPage == 1 ? primaryBrown : Colors.white,
            ),
            Icon(
              Icons.favorite_outline,
              color: _currentPage == 2 ? primaryBrown : Colors.white,
            ),
            Icon(
              Icons.chat_bubble_outline,
              color: _currentPage == 3 ? primaryBrown : Colors.white,
            ),
            Icon(
              Icons.account_circle_outlined,
              color: _currentPage == 4 ? primaryBrown : Colors.white,
            ),
          ],
        ),
        // SingleChildScrollView(
        //   child: Padding(
        //     padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.symmetric(
        //               horizontal: 16.0, vertical: 0.0),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     'Location',
        //                     style: TextStyle(
        //                       fontSize: 12,
        //                       color: Colors.grey,
        //                       fontWeight: FontWeight.normal,
        //                       fontFamily: 'Poppins',
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     height: 5,
        //                   ),
        //                   Row(
        //                     children: [
        //                       Icon(
        //                         Icons.location_on,
        //                         color: primaryBrown,
        //                       ),
        //                       Text(
        //                         'New York, USA',
        //                         style: TextStyle(
        //                           fontSize: 15,
        //                           color: primaryBrown,
        //                           fontWeight: FontWeight.bold,
        //                           fontFamily: 'Poppins',
        //                         ),
        //                       ),
        //                       Icon(
        //                         Icons.keyboard_arrow_down,
        //                         color: primaryBrown,
        //                       ),
        //                     ],
        //                   )
        //                 ],
        //               ),
        //               InkWell(
        //                 child: Container(
        //                   height: 35,
        //                   width: 35,
        //                   child: Icon(
        //                     Icons.notifications,
        //                     color: Colors.black,
        //                     size: 20,
        //                   ),
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(1000),
        //                     color: Colors.grey.shade300,
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         SizedBox(
        //           height: 16,
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(
        //               horizontal: 16.0, vertical: 0.0),
        //           child: Row(
        //             children: [
        //               Expanded(
        //                 child: TextField(
        //                   decoration: InputDecoration(
        //                     border: OutlineInputBorder(
        //                       borderSide: BorderSide(
        //                         width: 1,
        //                         color: primaryBrown,
        //                       ),
        //                       borderRadius: BorderRadius.circular(15.0),
        //                     ),
        //                     focusedBorder: OutlineInputBorder(
        //                       borderSide: BorderSide(
        //                         width: 1,
        //                         color: primaryBrown,
        //                       ),
        //                       borderRadius: BorderRadius.circular(15.0),
        //                     ),
        //                     hintText: "Search",
        //                     hintStyle: TextStyle(
        //                       fontSize: 13,
        //                       fontFamily: 'Poppins',
        //                       color: primaryBrown,
        //                     ),
        //                     prefixIcon: Icon(
        //                       Icons.search,
        //                       color: primaryBrown,
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               SizedBox(
        //                 width: 10,
        //               ),
        //               InkWell(
        //                 onTap: () {
        //                 },
        //                 child: Container(
        //                   height: 35,
        //                   width: 35,
        //                   child: Icon(
        //                     Icons.tune,
        //                     color: Colors.white,
        //                     size: 20,
        //                   ),
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(1000),
        //                     color: primaryBrown,
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         SizedBox(
        //           height: 16,
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(
        //               horizontal: 10.0, vertical: 0.0),
        //           child: SizedBox(
        //             height: 175, // Height of the banner
        //             child: PageView.builder(
        //               controller: _pageController,
        //               itemCount: banners.length,
        //               itemBuilder: (context, index) {
        //                 return BannerItem(
        //                   title: banners[index]["title"]!,
        //                   subtitle: banners[index]["subtitle"]!,
        //                 );
        //               },
        //             ),
        //           ),
        //         ),
        //         SizedBox(height: 10),
        //         SmoothPageIndicator(
        //           controller: _pageController,
        //           count: banners.length,
        //           effect: ScrollingDotsEffect(
        //             activeDotColor: Colors.brown,
        //             dotColor: Colors.grey,
        //             dotHeight: 8,
        //             dotWidth: 8,
        //             spacing: 5,
        //           ),
        //         ),
        //         SizedBox(
        //           height: 16,
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(
        //               horizontal: 16.0, vertical: 0.0),
        //           child: Row(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Text(
        //                 'Category',
        //                 style: TextStyle(
        //                   fontSize: 17,
        //                   color: Colors.black,
        //                   fontWeight: FontWeight.bold,
        //                   fontFamily: 'Poppins',
        //                 ),
        //               ),
        //               Text(
        //                 'See All',
        //                 style: TextStyle(
        //                   fontSize: 14,
        //                   color: primaryBrown,
        //                   fontWeight: FontWeight.normal,
        //                   fontFamily: 'Poppins',
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         SizedBox(
        //           height: 16,
        //         ),
        //         Padding(
        //           padding:
        //           EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        //           child: Row(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Text(
        //                 'Flash Sale',
        //                 style: TextStyle(
        //                   fontSize: 17,
        //                   color: Colors.black,
        //                   fontWeight: FontWeight.bold,
        //                   fontFamily: 'Poppins',
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
