import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trendy_fashion/Response/ResendCodeResponse.dart';
import 'package:trendy_fashion/Response/VerifyEmailResponse.dart';
import 'package:trendy_fashion/helper/ApiBaseHelper.dart';
import 'package:trendy_fashion/widget/appWidget/api.dart';

import '../widget/appWidget//setSnackbarScafold.dart';

class Verifyemailprovider extends ChangeNotifier {
  String? code1, code2, code3, code4, code5, code6;
  String? email;
  bool isProfileVerified = false;
  bool isResendCode = false;

  Future<void> VerifyEmail(
    BuildContext context,
    String email,
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
    Function updateNow,
  ) async {
    var VerificationCode = code1! + code2! + code3! + code4! + code5! + code6!;
    final Map<String, String> data = {
      'email': email,
      'verificationCode': VerificationCode
    };

    print("url : $data");

    ApiBaseHelper().postAPICall(verifyEmail, data).then((response) async {
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        Verifyemailresponse res = Verifyemailresponse.fromJson(jsonResponse);
        print("url : $res");
        if (res.status == 1) {
          isProfileVerified = true;
          setSnackbarScafold(scaffoldMessengerKey, context, res.message!);
          updateNow();
        } else {
          isProfileVerified = false;
          setSnackbarScafold(scaffoldMessengerKey, context, res.message!);
          updateNow();
        }
      } else {
        isProfileVerified = false;
        updateNow();
      }
    }, onError: (error) {
      isProfileVerified = false;
      setSnackbarScafold(scaffoldMessengerKey, context, error.toString());
      updateNow();
    });
  }

  Future<void> ResendCode(
    BuildContext context,
    String email,
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
    Function updateNow,
  ) async {
    final Map<String, String> data = {
      'email': email,
    };

    ApiBaseHelper().postAPICall(resendCode, data).then((response) async {
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        Resendcoderesponse res = Resendcoderesponse.fromJson(jsonResponse);
        print("url : $res");
        if (res.status == 1) {
          isResendCode = true;
          setSnackbarScafold(scaffoldMessengerKey, context, res.message!);
          updateNow();
        } else {
          isResendCode = false;
          setSnackbarScafold(scaffoldMessengerKey, context, res.message!);
          updateNow();
        }
      } else {
        isResendCode = false;
        updateNow();
      }
    }, onError: (error) {
      isResendCode = false;
      setSnackbarScafold(scaffoldMessengerKey, context, error.toString());
      updateNow();
    });
  }
}
