import 'package:flutter/material.dart';
import 'package:trendy_fashion/Response/ProductResponse.dart';
import 'package:trendy_fashion/widget/appWidget/api.dart';
import 'package:trendy_fashion/widget/appWidget/parameterString.dart';
import 'package:trendy_fashion/widget/appWidget/sharedPreferances.dart';
import '../helper/ApiBaseHelper.dart';
import '../model/Product.dart';
import '../widget/appWidget/setSnackbarScafold.dart';

class Productprovider extends ChangeNotifier {
  bool isSuccess = false;
  bool isProductLoading = true;
  String? Msg;
  List<Product> productList = [];
  String SelectedCategory = "All";
  String SelectedFilter = "All";

  Future<void> getAllProducts(
    BuildContext context,
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
    Function updateNow,
  ) async {
    String category = await getPrefrence(DashboardSelectedCategory);
    String filter = await getPrefrence(DashboardSelectedFilter);
    final Map<String, String> data = {'category': category, 'filter': filter};
    ApiBaseHelper().getAPICallWithParam(getAllProduct, data).then(
        (response) async {
      Productresponse res = Productresponse.fromJson(response);
      if (res.status == 1) {
        isSuccess = true;
        isProductLoading = false;
        productList.clear();
        productList = res.data!.cast<Product>();
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

  Future<void> setSelectedCategory(
    BuildContext context,
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
    Function updateNow,
    String selected_category,
  ) async {
    await setPrefrence(DashboardSelectedCategory, selected_category);
    updateNow();
  }

  Future<void> getSelectedCategory(
    BuildContext context,
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
    Function updateNow,
  ) async {
    SelectedCategory = await getPrefrence(DashboardSelectedCategory);
    if (SelectedCategory == "") {
      SelectedCategory = "All";
    }
    updateNow();
  }

  Future<void> setSelectedFilter(
    BuildContext context,
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
    Function updateNow,
    String selected_filter,
  ) async {
    await setPrefrence(DashboardSelectedFilter, selected_filter);
    updateNow();
  }

  Future<void> getSelectedFilter(
    BuildContext context,
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
    Function updateNow,
  ) async {
    SelectedFilter = await getPrefrence(DashboardSelectedFilter);
    if (SelectedFilter == "") {
      SelectedFilter = "All";
    }
    updateNow();
  }
}
