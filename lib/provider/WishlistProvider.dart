import 'package:flutter/material.dart';
import 'package:trendy_fashion/Response/WishlistResponse.dart';
import 'package:trendy_fashion/helper/ApiBaseHelper.dart';
import 'package:trendy_fashion/model/Product.dart';
import 'package:trendy_fashion/widget/appWidget/parameterString.dart';
import 'package:trendy_fashion/widget/appWidget/setSnackbarScafold.dart';
import 'package:trendy_fashion/widget/appWidget/sharedPreferances.dart';

import '../Response/ProductResponse.dart';
import '../model/Wishlist.dart';
import '../widget/appWidget/api.dart';

class WishlistProvider extends ChangeNotifier {
  bool isSuccess = false;
  bool isProductLoading = true;
  bool isWishlistLoading = true;
  bool isWishlistFetched = false;
  String? Msg;
  List<Wishlist> wishlistList = [];
  List<Product> wishlistedProduct = [];

  Future<void> getAllWishlist(
    BuildContext context,
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
    Function updateNow,
  ) async {
    int userid = await getPrefrenceInt(userId);
    final Map<String, String> data = {"userId": userid.toString()};
    ApiBaseHelper().postApiCallFormated(getAllWishlistApi, data).then(
        (response) async {
      WishlistResponse res = WishlistResponse.fromJson(response);
      if (res.status == 1) {
        isWishlistLoading = false;
        isWishlistFetched = true;
        wishlistList.clear();
        wishlistList = res.data!;
        updateNow();
      } else {
        isWishlistLoading = false;
        isWishlistFetched = false;
        setSnackbarScafold(scaffoldMessengerKey, context, res.message!);
        updateNow();
      }
    }, onError: ((error) {
      isWishlistLoading = false;
      setSnackbarScafold(scaffoldMessengerKey, context, error.toString());
      updateNow();
    }));
  }

  Future<void> addWishlist(
    BuildContext context,
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
    Function updateNow,
    int productId,
  ) async {
    int userid = await getPrefrenceInt(userId);
    final Map<String, String> data = {
      "userId": userid.toString(),
      "productId": productId.toString(),
    };

    ApiBaseHelper().postApiCallFormated(addToWishlist, data).then((response) {
      WishlistResponse res = WishlistResponse.fromJson(response);

      if (res.status == 1) {
        setSnackbarScafold(scaffoldMessengerKey, context, res.message!);
        getAllWishlist(context, scaffoldMessengerKey, updateNow);
      } else {
        setSnackbarScafold(scaffoldMessengerKey, context, res.message!);
      }
    }, onError: ((error) {
      isWishlistLoading = false;
      setSnackbarScafold(scaffoldMessengerKey, context, error.toString());
      updateNow();
    }));
  }

  Future<void> getWishlistedProduct(
    BuildContext context,
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
    Function updateNow,
  ) async {
    int userid = await getPrefrenceInt(userId);
    final Map<String, String> data = {"userId": userid.toString()};
    ApiBaseHelper().postApiCallFormated(getAllWishlistApi, data).then(
        (response) async {
      WishlistResponse res = WishlistResponse.fromJson(response);
      if (res.status == 1) {
        isWishlistLoading = false;
        isWishlistFetched = true;
        wishlistList.clear();
        wishlistList = res.data!;
        getWishlistedProductList(context, scaffoldMessengerKey, updateNow);
      } else {
        isWishlistLoading = false;
        isWishlistFetched = false;
        setSnackbarScafold(scaffoldMessengerKey, context, res.message!);
      }
    }, onError: ((error) {
      isWishlistLoading = false;
      setSnackbarScafold(scaffoldMessengerKey, context, error.toString());
      updateNow();
    }));
  }

  Future<void> getWishlistedProductList(
    BuildContext context,
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
    Function updateNow,
  ) async {
    wishlistedProduct.clear();
    final Map<String, String> data = {'category': 'All', 'filter': 'All'};
    ApiBaseHelper().getAPICallWithParam(getAllProduct, data).then(
        (response) async {
      Productresponse res = Productresponse.fromJson(response);
      if (res.status == 1) {
        isSuccess = true;
        isProductLoading = false;
        List<Product> productList = res.data!.cast<Product>();
        if (wishlistList.isNotEmpty) {
          for (int i = 0; i < productList.length; i++) {
            for(int j = 0 ; j < wishlistList.length; j++){
              if(productList[i].productId == wishlistList[j].productId){
                wishlistedProduct.add(productList[i]);
              }
            }
          }
        }
        updateNow();
      } else {
        isSuccess = false;
        isProductLoading = false;
        updateNow();
      }
    }, onError: ((error) {
      isSuccess = false;
      isProductLoading = false;
      setSnackbarScafold(scaffoldMessengerKey, context, error.toString());
      updateNow();
    }));
  }
}
