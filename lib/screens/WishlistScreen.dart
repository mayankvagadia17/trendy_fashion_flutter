import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trendy_fashion/screens/productDetailsScreen.dart';
import 'package:trendy_fashion/widget/wishlistWidgets/WishlistCard.dart';

import '../helper/Color.dart';
import '../model/Product.dart';
import '../provider/CategoryProvider.dart';
import '../provider/ProductProvider.dart';
import '../provider/WishlistProvider.dart';

class Wishlistscreen extends StatefulWidget {
  const Wishlistscreen({super.key});

  @override
  State<Wishlistscreen> createState() => _WishlistscreenState();
}

bool _isWishlistloading = true;
bool _isProductLoading = true;

class _WishlistscreenState extends State<Wishlistscreen> {
  late WishlistProvider wishlistProvider;
  late Productprovider productprovider;
  late Categoryprovider categoryprovider;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  String? SelectedCategry = "All";
  bool _isMounted = true;

  @override
  void initState() {
    super.initState();
    productprovider = Provider.of<Productprovider>(context, listen: false);
    categoryprovider = Provider.of<Categoryprovider>(context, listen: false);
    wishlistProvider = Provider.of<WishlistProvider>(context, listen: false);
    productprovider.getAllProducts(
        context, scaffoldMessengerKey, updateProductNow);
    wishlistProvider.getWishlistedProduct(
        context, scaffoldMessengerKey, updateWishlistNow);
    categoryprovider.getCategory(
        context, scaffoldMessengerKey, updateCategoryNow);
  }

  updateCategoryNow() {
    if (_isMounted) {
      setState(() {});
    }
  }

  updateWishlistNow() {
    if (_isMounted) {
      setState(() {
        _isWishlistloading = false;
      });
    }
  }

  updateProductNow() {
    if (_isMounted) {
      setState(() {
        _isProductLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _isWishlistloading
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
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'My Wishlist',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                                                  .categoryName;
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
                                                  .categoryName;
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
                    SizedBox(
                      height: 10,
                    ),
                    !wishlistProvider.isWishlistLoading
                        ? wishlistProvider.wishlistList.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      wishlistProvider.wishlistedProduct.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 0,
                                    mainAxisSpacing: 0,
                                    childAspectRatio: 0.85,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Wishlistcard(
                                      product: wishlistProvider
                                          .wishlistedProduct[index],
                                      onItemTapped: onItemTapped,
                                    );
                                  },
                                ),
                              )
                            : Text(
                                "No Product in wishlist",
                              )
                        : const Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
      ),
    );
  }

  void onItemTapped(Product item) {
    Navigator.of(context)
        .push(new MaterialPageRoute(
            builder: (context) => Productdetailsscreen(product: item)))
        .then((value) => setState(() => {}));
  }
}
