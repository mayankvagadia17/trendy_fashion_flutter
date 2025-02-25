import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendy_fashion/helper/Color.dart';

import '../model/Product.dart';
import '../provider/WishlistProvider.dart';

class Productdetailsscreen extends StatefulWidget {
  late Product product;

  Productdetailsscreen({super.key, required this.product});

  @override
  State<Productdetailsscreen> createState() => _ProductdetailsscreenState();
}

String _selectedSize = "";
bool _isWishlistloading = true;

class _ProductdetailsscreenState extends State<Productdetailsscreen> {
  late WishlistProvider wishlistProvider;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    _selectedSize = "S";

    wishlistProvider = Provider.of<WishlistProvider>(context, listen: false);
    wishlistProvider.getAllWishlist(
        context, scaffoldMessengerKey, updateWishlistNow);
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
        backgroundColor: white,
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
            : Stack(
                fit: StackFit.expand,
                children: [
                  SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_back,
                                          color: Colors.black),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ),
                                  Text(
                                    "Product Details",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  if (wishlistProvider.wishlistList.any(
                                      (item) =>
                                          item.productId ==
                                          widget.product.productId))
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.favorite,
                                          color: primaryBrown,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isWishlistloading = true;
                                          });
                                          wishlistProvider.addWishlist(
                                              context,
                                              scaffoldMessengerKey,
                                              updateWishlistNow,
                                              widget.product.productId!);
                                        },
                                      ),
                                    )
                                  else
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: primaryBrown,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isWishlistloading = true;
                                          });
                                          wishlistProvider.addWishlist(
                                              context,
                                              scaffoldMessengerKey,
                                              updateWishlistNow,
                                              widget.product.productId!);
                                        },
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Image.network(
                              widget.product.images!.first,
                              width: double.infinity,
                              height: 250,
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${widget.product.category}',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              color: greyText,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${widget.product.name}',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              color: primaryBrown,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            size: 20,
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${widget.product.rating}',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              color: greyText,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Product Details',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      color: black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${widget.product.description}',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      color: greyText,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    color: greyText,
                                    thickness: 0.7,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Select Size',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      color: black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      if (widget.product.stock!.S != 0)
                                        if (_selectedSize == "S")
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _selectedSize = "S";
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: primaryBrown,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                border: Border.all(
                                                  color: greyText,
                                                  width: 1,
                                                ),
                                              ),
                                              height: 50,
                                              width: 50,
                                              child: const Center(
                                                child: Text(
                                                  'S',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    color: white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        else
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _selectedSize = "S";
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                border: Border.all(
                                                  color: greyText,
                                                  width: 1,
                                                ),
                                              ),
                                              height: 50,
                                              width: 50,
                                              child: const Center(
                                                child: Text(
                                                  'S',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    color: black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      if (widget.product.stock!.M != 0)
                                        if (_selectedSize == "M")
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _selectedSize = "M";
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: primaryBrown,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                border: Border.all(
                                                  color: greyText,
                                                  width: 1,
                                                ),
                                              ),
                                              height: 50,
                                              width: 50,
                                              child: const Center(
                                                child: Text(
                                                  'M',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    color: white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        else
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _selectedSize = "M";
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                border: Border.all(
                                                  color: greyText,
                                                  width: 1,
                                                ),
                                              ),
                                              height: 50,
                                              width: 50,
                                              child: const Center(
                                                child: Text(
                                                  'M',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    color: black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      if (widget.product.stock!.L != 0)
                                        if (_selectedSize == "L")
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _selectedSize = "L";
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: primaryBrown,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                border: Border.all(
                                                  color: greyText,
                                                  width: 1,
                                                ),
                                              ),
                                              height: 50,
                                              width: 50,
                                              child: const Center(
                                                child: Text(
                                                  'L',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    color: white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        else
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _selectedSize = "L";
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                border: Border.all(
                                                  color: greyText,
                                                  width: 1,
                                                ),
                                              ),
                                              height: 50,
                                              width: 50,
                                              child: const Center(
                                                child: Text(
                                                  'L',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    color: black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      if (widget.product.stock!.XL != 0)
                                        if (_selectedSize == "XL")
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _selectedSize = "XL";
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: primaryBrown,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                border: Border.all(
                                                  color: greyText,
                                                  width: 1,
                                                ),
                                              ),
                                              height: 50,
                                              width: 50,
                                              child: const Center(
                                                child: Text(
                                                  'XL',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    color: white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        else
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _selectedSize = "XL";
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                border: Border.all(
                                                  color: greyText,
                                                  width: 1,
                                                ),
                                              ),
                                              height: 50,
                                              width: 50,
                                              child: const Center(
                                                child: Text(
                                                  'XL',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    color: black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      if (widget.product.stock!.XXL != 0)
                                        if (_selectedSize == "XXL")
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _selectedSize = "XXL";
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: primaryBrown,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                border: Border.all(
                                                  color: greyText,
                                                  width: 1,
                                                ),
                                              ),
                                              height: 50,
                                              width: 50,
                                              child: const Center(
                                                child: Text(
                                                  'XXL',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    color: white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        else
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _selectedSize = "XXL";
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                border: Border.all(
                                                  color: greyText,
                                                  width: 1,
                                                ),
                                              ),
                                              height: 50,
                                              width: 50,
                                              child: const Center(
                                                child: Text(
                                                  'XXL',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    color: black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    color: greyText,
                                    thickness: 0.7,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 20,
                              offset: Offset(5, 10),
                              spreadRadius: 0.1,
                              blurStyle: BlurStyle.normal),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Total Price',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: greyText,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Text(
                                  '\$${widget.product.price}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: black,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton.icon(
                              icon: Icon(
                                Icons.shopping_bag,
                                color: white,
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: 14,
                                  horizontal: 45,
                                ),
                                backgroundColor: primaryBrown,
                              ),
                              onPressed: () {},
                              label: Text(
                                'Add To Cart',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
