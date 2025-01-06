import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trendy_fashion/helper/ApiBaseHelper.dart';
import 'package:trendy_fashion/widget/api.dart';

import '../Response/CreateProfileResponse.dart';
import '../widget/parameterString.dart';
import '../widget/setSnackbarScafold.dart';
import '../widget/sharedPreferances.dart';

class SignupProvider extends ChangeNotifier {
  String? email, password, name;

  bool isProfileCreated = false;

  Future<void> CreateUser(
    BuildContext context,
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
    Function updateNow,
  ) async {
    final Map<String, String> data = {
      'name': name!,
      'email': email!,
      'country': 'india',
      'password': password!
    };

    ApiBaseHelper().postAPICall(createProfileUri, data).then(
      (response) async {
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonResponse = jsonDecode(response.body);
          Createprofileresponse res =
              Createprofileresponse.fromJson(jsonResponse);
          print("url : $res");
          if (res.status == 1) {
            isProfileCreated = true;
            setPrefrence(accessToken, res.data!.token!);
            setSnackbarScafold(scaffoldMessengerKey, context, res.message!);
          } else {
            isProfileCreated = false;
            setSnackbarScafold(scaffoldMessengerKey, context, res.message!);
          }
          updateNow();
        } else {
          isProfileCreated = false;
          updateNow();
        }
      },
      onError: (error) {
        isProfileCreated = false;
        setSnackbarScafold(scaffoldMessengerKey, context, error.toString());
        updateNow();
      },
    );
  }
}
