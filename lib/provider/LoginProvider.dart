import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trendy_fashion/Response/LoginResponse.dart';
import 'package:trendy_fashion/helper/ApiBaseHelper.dart';
import 'package:trendy_fashion/widget/api.dart';
import 'package:trendy_fashion/widget/parameterString.dart';
import 'package:trendy_fashion/widget/sharedPreferances.dart';

import '../widget/setSnackbarScafold.dart';

class LoginProvider extends ChangeNotifier {
  String? email, password;

  bool isSuccess = false;

  Future<void> getLoginUser(
    BuildContext context,
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
    Function updateNow,
  ) async {
    final Map<String, String> data = {'email': email!, 'password': password!};

    ApiBaseHelper().postAPICall(loginUri, data).then(
      (data) async {
        if (data.statusCode == 200) {
          Map<String, dynamic> jsonResponse = jsonDecode(data.body);
          Loginresponse res = Loginresponse.fromJson(jsonResponse);
          print("url : $res");
          if (res.status == 1) {
            isSuccess = true;
            setPrefrence(accessToken, res.data!.token!);
            setSnackbarScafold(scaffoldMessengerKey, context, res.message!);
          } else {
            isSuccess = false;
            setSnackbarScafold(scaffoldMessengerKey, context, res.message!);
          }
          updateNow();
        } else {
          isSuccess = false;
          updateNow();
        }
      },
      onError: (error) {
        isSuccess = false;
        setSnackbarScafold(scaffoldMessengerKey, context, error.toString());
        updateNow();
      },
    );
  }
}
