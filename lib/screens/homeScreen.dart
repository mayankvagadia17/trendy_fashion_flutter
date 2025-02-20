import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:trendy_fashion/screens/cartScreen.dart';
import 'package:trendy_fashion/screens/WishlistScreen.dart';
import 'package:trendy_fashion/screens/dashBoardScreen.dart';
import 'package:trendy_fashion/screens/profileScreen.dart';

import '../helper/Color.dart';

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

  int selectedScreenIndex = 0;
  int fixedIndicatorIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedScreenIndex = index; // Change only the screen
      // fixedIndicatorIndex is NOT updated, so the indicator stays fixed
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        extendBody: false,
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: _currentPage,
          children: _screens,
        ),
        bottomNavigationBar: DotCurvedBottomNav(
          selectedIndex: fixedIndicatorIndex,
          scrollController: _scrollController,
          hideOnScroll: false,
          indicatorColor: primaryBrown,
          backgroundColor: bottomNavigationColor,
          indicatorSize: 5,
          borderRadius: 10,
          height: 60,
          onTap: (index) {
            if (index == 1) {
              // setState(() => index == _currentPage);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Cartscreen(),
              ));
            } else {
              setState(() => _currentPage = index);
            }
          },
          items: [
            Icon(
              Icons.home_outlined,
              color: _currentPage == 0 ? Colors.white : Colors.grey.shade700,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: _currentPage == 1 ? Colors.white : Colors.grey.shade700,
            ),
            Icon(
              Icons.favorite_outline,
              color: _currentPage == 2 ? Colors.white : Colors.grey.shade700,
            ),
            Icon(
              Icons.chat_bubble_outline,
              color: _currentPage == 3 ? Colors.white : Colors.grey.shade700,
            ),
            Icon(
              Icons.account_circle_outlined,
              color: _currentPage == 4 ? Colors.white : Colors.grey.shade700,
            ),
          ],
        ),
      ),
    );
  }
}
