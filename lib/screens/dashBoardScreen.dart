import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendy_fashion/helper/Strings.dart';
import 'package:trendy_fashion/provider/CategoryProvider.dart';
import 'package:trendy_fashion/provider/ProductProvider.dart';
import 'package:trendy_fashion/widget/dashboardWidgets/FilterBox.dart';
import '../helper/Color.dart';
import '../widget/dashboardWidgets/BannerCarousel.dart';
import '../widget/dashboardWidgets/CategorySection.dart';
import '../widget/dashboardWidgets/FlashSaleSection.dart';
import '../widget/dashboardWidgets//HeaderSection.dart';
import '../widget/dashboardWidgets/ProductGridView.dart';
import '../widget/dashboardWidgets/SearchBar.dart';
import 'ProductCard.dart';

class Dashboardscreen extends StatefulWidget {
  Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

bool _isCategoryLoading = true;
bool _isProductLoading = true;

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
  late Categoryprovider categoryprovider;
  late Productprovider productprovider;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    categoryprovider = Provider.of<Categoryprovider>(context, listen: false);
    productprovider = Provider.of<Productprovider>(context, listen: false);
    categoryprovider.getCategory(
        context, scaffoldMessengerKey, updateCategoryNow);
    productprovider.getAllProducts(
        context, scaffoldMessengerKey, updateProductNow);
  }

  updateCategoryNow() {
    setState(() {
      _isCategoryLoading = false;
    });
  }

  updateProductNow() {
    setState(() {
      _isProductLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _isCategoryLoading
            ? Stack(
                children: [
                  Opacity(
                    opacity: 0.3,
                    child:
                        ModalBarrier(dismissible: false, color: Colors.black),
                  ),
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              )
            : SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeaderSection(),
                    SizedBox(height: 16),
                    AppSearchBar(),
                    SizedBox(height: 16),
                    BannerCarousel(),
                    SizedBox(height: 16),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
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
                    SizedBox(height: 16),
                    CategorySection(categoryprovider: categoryprovider),
                    SizedBox(height: 16),
                    FlashSaleSection(),
                    SizedBox(height: 16),
                    Filterbox(),
                    ProductGridView(productProvider: productprovider),
                  ],
                ),
              ),
      ),
    );
  }
}
