import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trendy_fashion/Response/ProductResponse.dart';
import 'package:trendy_fashion/widget/appWidget/api.dart';

import '../helper/ApiBaseHelper.dart';
import '../model/Product.dart';

class Productprovider extends ChangeNotifier {
  bool isSuccess = false;
  String? Msg;
  List<Product> productList = [];

  Future<void> getAllProducts(
    BuildContext context,
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
    Function updateNow,
  ) async {
    ApiBaseHelper().getAPICall(getAllProduct).then((response) async {
      Productresponse res = Productresponse.fromJson(response);
      if (res.status == 1) {
        isSuccess = true;
        productList = res.data!.cast<Product>();
        updateNow();
      } else {
        isSuccess = false;
        updateNow();
      }
    });
  }
}
