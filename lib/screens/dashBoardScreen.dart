import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trendy_fashion/helper/Strings.dart';
import 'package:trendy_fashion/model/Product.dart';
import 'package:trendy_fashion/provider/CategoryProvider.dart';
import 'package:trendy_fashion/provider/ProductProvider.dart';
import 'package:trendy_fashion/provider/WishlistProvider.dart';
import 'package:trendy_fashion/screens/productDetailsScreen.dart';
import '../helper/Color.dart';
import '../widget/dashboardWidgets/BannerItem.dart';
import '../widget/dashboardWidgets/TimerBox.dart';
import '../widget/dashboardWidgets/ProductCard.dart';

class Dashboardscreen extends StatefulWidget {
  Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  // Move these variables inside the state class
  bool _isCategoryLoading = true;
  bool _isProductLoading = true;
  bool _isWishlistloading = false;
  bool _isMounted = true; // Add a flag to track mounted status

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
  late WishlistProvider wishlistProvider;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();
  String? SelectedCategry, SelectedFilter;

  @override
  void initState() {
    super.initState();
    categoryprovider = Provider.of<Categoryprovider>(context, listen: false);
    productprovider = Provider.of<Productprovider>(context, listen: false);
    wishlistProvider = Provider.of<WishlistProvider>(context, listen: false);

    // Load initial data
    _loadData();
  }

  // New method to load all data
  void _loadData() {
    categoryprovider.getCategory(
        context, scaffoldMessengerKey, updateCategoryNow);
    productprovider.getAllProducts(
        context, scaffoldMessengerKey, updateProductNow);
    wishlistProvider.getAllWishlist(
        context, scaffoldMessengerKey, updateWishlistNow);
    productprovider.getSelectedCategory(
        context, scaffoldMessengerKey, getselectedCategoryUpdateNow);
    productprovider.getSelectedFilter(
        context, scaffoldMessengerKey, getselectedFilterUpdateNow);
  }

  @override
  void dispose() {
    _isMounted = false; // Set flag to false when widget is disposed
    _pageController.dispose(); // Clean up the page controller
    super.dispose();
  }

  // Only call setState if the widget is still mounted
  updateCategoryNow() {
    if (_isMounted) {
      setState(() {
        _isCategoryLoading = false;
      });
    }
  }

  // Only call setState if the widget is still mounted
  updateProductNow() {
    if (_isMounted) {
      setState(() {
        _isProductLoading = false;
      });
    }
  }

  // Only call setState if the widget is still mounted
  updateWishlistNow() {
    if (_isMounted) {
      setState(() {
        _isWishlistloading = false;
      });
    }
  }

  // Only call setState if the widget is still mounted
  getselectedCategoryUpdateNow() {
    if (_isMounted) {
      setState(() {
        SelectedCategry = productprovider.SelectedCategory;
      });
    }
  }

  // Only call setState if the widget is still mounted
  getselectedFilterUpdateNow() {
    if (_isMounted) {
      setState(() {
        SelectedFilter = productprovider.SelectedFilter;
      });
    }
  }

  // Only call setState if the widget is still mounted
  selectedCategoryUpdateNow() {
    if (_isMounted) {
      setState(() {});
    }
  }

  // Only call setState if the widget is still mounted
  setFilterupdateNow() {
    if (_isMounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _isCategoryLoading || _isProductLoading
            ? Stack(
          children: [
            Opacity(
              opacity: 0.3,
              child: ModalBarrier(
                  dismissible: false, color: Colors.transparent),
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
              !categoryprovider.isCategoryLoading
                  ? categoryprovider.categoryList.isNotEmpty
                  ? SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                  categoryprovider.categoryList.length,
                  itemBuilder: (context, index) {
                    if (SelectedCategry ==
                        categoryprovider
                            .categoryList[index].categoryName) {
                      return InkWell(
                        onTap: () {
                          if (_isMounted) {
                            setState(() {
                              SelectedCategry = categoryprovider
                                  .categoryList[index]
                                  .categoryName!;
                              productprovider.setSelectedCategory(
                                  context,
                                  scaffoldMessengerKey,
                                  selectedCategoryUpdateNow,
                                  categoryprovider
                                      .categoryList[index]
                                      .categoryName!);
                              _isProductLoading = true;
                              productprovider.getAllProducts(
                                  context,
                                  scaffoldMessengerKey,
                                  updateProductNow);
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Column(
                            children: [
                              Center(
                                child: ClipOval(
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    color: primaryBrown,
                                    child: Center(
                                      child: SvgPicture.network(
                                        categoryprovider
                                            .categoryList[index]
                                            .categoryIcon!,
                                        placeholderBuilder: (context) =>
                                            CircularProgressIndicator(
                                                color:
                                                primaryBrown,
                                                backgroundColor:
                                                categorylistviewbackgroundColor),
                                        height: 25,
                                        width: 25,
                                        colorFilter:
                                        ColorFilter.mode(
                                            categorylistviewbackgroundColor,
                                            BlendMode
                                                .srcIn),
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
                                    .categoryList[index]
                                    .categoryName!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: primaryBrown,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return InkWell(
                        onTap: () {
                          if (_isMounted) {
                            setState(() {
                              SelectedCategry = categoryprovider
                                  .categoryList[index]
                                  .categoryName!;
                              productprovider.setSelectedCategory(
                                  context,
                                  scaffoldMessengerKey,
                                  selectedCategoryUpdateNow,
                                  categoryprovider
                                      .categoryList[index]
                                      .categoryName!);
                              _isProductLoading = true;
                              productprovider.getAllProducts(
                                  context,
                                  scaffoldMessengerKey,
                                  updateProductNow);
                            });
                          }
                        },
                        child: Padding(
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
                                        colorFilter:
                                        ColorFilter.mode(
                                            primaryBrown,
                                            BlendMode
                                                .srcIn),
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
                                    .categoryList[index]
                                    .categoryName!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: primaryBrown,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              )
                  : Text("No Category")
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
                      if (SelectedFilter == Strings().Filter[index]) {
                        return InkWell(
                          onTap: () {
                            if (_isMounted) {
                              setState(() {
                                SelectedFilter = Strings().Filter[index];
                                productprovider.setSelectedFilter(
                                    context,
                                    scaffoldMessengerKey,
                                    setFilterupdateNow,
                                    Strings().Filter[index]);
                                _isProductLoading = true;
                                productprovider.getAllProducts(context,
                                    scaffoldMessengerKey, updateProductNow);
                              });
                            }
                          },
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 4.0),
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      30,
                                    ),
                                  ),
                                  border: Border.all(color: primaryBrown),
                                  color: primaryBrown),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.0),
                                  child: Text(
                                    Strings().Filter[index],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return InkWell(
                          onTap: () {
                            if (_isMounted) {
                              setState(() {
                                SelectedFilter = Strings().Filter[index];
                                productprovider.setSelectedFilter(
                                    context,
                                    scaffoldMessengerKey,
                                    setFilterupdateNow,
                                    Strings().Filter[index]);
                                _isProductLoading = true;
                                productprovider.getAllProducts(context,
                                    scaffoldMessengerKey, updateProductNow);
                              });
                            }
                          },
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 4.0),
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      30,
                                    ),
                                  ),
                                  border:
                                  Border.all(color: primaryBrown)),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.0),
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
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              !productprovider.isProductLoading
                  ? productprovider.productList.isNotEmpty
                  ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: productprovider.productList.length,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product:
                      productprovider.productList[index],
                      wishlist: wishlistProvider.wishlistList,
                      onItemTapped: onItemTapped,
                      onFavoriteIconTapped:
                      onFavoriteIconTapped,
                    );
                  },
                ),
              )
                  : Column(
                children: [
                  SizedBox(height: 16),
                  Text("No products available."),
                ],
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

  void onItemTapped(Product item) {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (context) => Productdetailsscreen(product: item)))
        .then((value) {
      if (_isMounted) {
        setState(() {});
      }
    });
  }

  void onFavoriteIconTapped(Product item) {
    if (_isMounted) {
      setState(() {
        _isWishlistloading = true;
      });
      wishlistProvider.addWishlist(
          context, scaffoldMessengerKey, updateWishlistNow, item.productId!);
    }
  }
}