import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../helper/Color.dart';
import '../provider/CategoryProvider.dart';
import '../provider/WishlistProvider.dart';

class Wishlistscreen extends StatefulWidget {
  const Wishlistscreen({super.key});

  @override
  State<Wishlistscreen> createState() => _WishlistscreenState();
}

bool _isWishlistloading = true;

class _WishlistscreenState extends State<Wishlistscreen> {
  late WishlistProvider wishlistProvider;
  late Categoryprovider categoryprovider;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    categoryprovider = Provider.of<Categoryprovider>(context, listen: false);
    wishlistProvider = Provider.of<WishlistProvider>(context, listen: false);
    wishlistProvider.getAllWishlist(
        context, scaffoldMessengerKey, updateWishlistNow);
    categoryprovider.getCategory(
        context, scaffoldMessengerKey, updateCategoryNow);
  }

  updateCategoryNow() {
    setState(() {
    });
  }

  updateWishlistNow() {
    setState(() {
      _isWishlistloading = false;
    });
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
                                                    colorFilter:
                                                        ColorFilter.mode(
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
                                            categoryprovider.categoryList[index]
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
                                    );
                                  },
                                ),
                              )
                            : Text("No Category")
                        : const Center(child: CircularProgressIndicator()),
                    SizedBox(
                      height: 20,
                    ),
                    !wishlistProvider.isWishlistLoading
                        ? wishlistProvider.wishlistList.isNotEmpty
                            ? Text(
                                "Loaded",
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
}
