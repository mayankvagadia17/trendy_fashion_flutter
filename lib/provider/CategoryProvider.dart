import 'package:flutter/material.dart';
import 'package:trendy_fashion/Response/CategoryResponse.dart';
import 'package:trendy_fashion/model/Category.dart';
import 'package:trendy_fashion/helper/ApiBaseHelper.dart';
import 'package:trendy_fashion/widget/appWidget/api.dart';

import '../widget/appWidget/parameterString.dart';
import '../widget/appWidget/setSnackbarScafold.dart';
import '../widget/appWidget/sharedPreferances.dart';

class Categoryprovider extends ChangeNotifier {
  bool isSuccess = false;
  bool isCategoryLoading = true;
  String? Msg;
  List<Category> categoryList = [];

  Future<void> getCategory(
    BuildContext context,
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
    Function updateNow,
  ) async {
    ApiBaseHelper().getAPICall(getAllCategory).then((response) async {
      Categoryresponse res = Categoryresponse.fromJson(response);
      if (res.status == 1) {
        isSuccess = true;
        isCategoryLoading = false;
        categoryList = res.data!.cast<Category>();
        updateNow();
      } else {
        isSuccess = false;
        isCategoryLoading = false;
        updateNow();
      }
    },onError: ((error) {
      isSuccess = false;
      isCategoryLoading = false;
      setSnackbarScafold(scaffoldMessengerKey, context, error.toString());
      updateNow();
    }));
  }
}
