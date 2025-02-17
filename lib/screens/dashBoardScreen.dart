import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trendy_fashion/helper/Strings.dart';
import 'package:trendy_fashion/provider/CategoryProvider.dart';
import 'package:trendy_fashion/provider/ProductProvider.dart';
import '../helper/Color.dart';
import '../widget/dashboardWidgets/BannerItem.dart';
import '../widget/dashboardWidgets/TimerBox.dart';
import '../widget/dashboardWidgets/ProductCard.dart';

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
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.brown),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: "Search",
                                prefixIcon: const Icon(Icons.search,
                                    color: Colors.brown),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {}, // Handle filter click
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.brown,
                              ),
                              child:
                                  const Icon(Icons.tune, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
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
                    ),
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
                    categoryprovider.categoryList.isNotEmpty
                        ? SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categoryprovider.categoryList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16.0),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: ClipOval(
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            color:
                                                categorylistviewbackgroundColor,
                                            child: Center(
                                              child: SvgPicture.network(
                                                categoryprovider
                                                    .categoryList[index]
                                                    .categoryIcon!,
                                                placeholderBuilder: (context) =>
                                                    CircularProgressIndicator(
                                                        color:
                                                            categorylistviewbackgroundColor,
                                                        backgroundColor:
                                                            primaryBrown),
                                                height: 25,
                                                width: 25,
                                                colorFilter: ColorFilter.mode(
                                                    primaryBrown,
                                                    BlendMode.srcIn),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        categoryprovider
                                            .categoryList[index].categoryName!,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: primaryBrown,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        : const Center(child: CircularProgressIndicator()),
                    SizedBox(height: 16),
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
                                  style:
                                      TextStyle(fontSize: 14, color: greyText)),
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
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                      child: SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Strings().Filter.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        30,
                                      ),
                                    ),
                                    border: Border.all(color: primaryBrown)),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24.0),
                                    child: Text(
                                      Strings().Filter[index],
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    productprovider.productList.isNotEmpty
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: productprovider.productList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                                childAspectRatio: 0.80,
                              ),
                              itemBuilder: (context, index) {
                                return ProductCard(
                                    product:
                                        productprovider.productList[index]);
                              },
                            ),
                          )
                        : Container(
                            height: 100,
                            child: Center(
                              child: Text(
                                'No products available.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
      ),
    );
  }
}
