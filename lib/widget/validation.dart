import 'package:flutter/material.dart';

class StringValidation {
// product name velidatation
  static String? validatePincode(String value, String? msg1) {
    if (value.isEmpty) {
      return msg1;
    } else {
      return null;
    }
  }

  static String? validateThisFieldRequered(
      String? value, BuildContext context) {
    if (value!.isEmpty) {
      return "This Field is Required";
    }
    return null;
  }

// password verification

  static String? validatePass(String? value, BuildContext context,
      {required bool onlyRequired}) {
    if (onlyRequired) {
      if (value!.isEmpty) {
        return 'Password is Required';
      } else {
        return null;
      }
    }
    return null;
  }

//email validation
  static String? validateEmail(String value, BuildContext context) {
    if (value.isEmpty) {
      return "Email Is Required";
    } else if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)"
            r'*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+'
            r'[a-z0-9](?:[a-z0-9-]*[a-z0-9])?')
        .hasMatch(value)) {
      return "Please Enter Valid Email Address";
    } else {
      return null;
    }
  }

//mobile verification

  static String? validateMob(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return "This Field is Required";
    }
    /* if (value.length < 5) {
      return getTranslated(context, "VALID_MOB");
    }*/
    return null;
  }

  static String? validateField(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return "This Field is Required";
    } else {
      return null;
    }
  }

  static String? validateField1(String value, String? msg) {
    if (value.isEmpty) {
      return msg;
    } else {
      return null;
    }
  }

// name validation

  static String? validateUserName(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return "name is Required";
    }
    return null;
  }

  static String? validateUserName1(
      String value, String? msg1, String? msg2, String? msg3) {
    //const pattern = r'^(?=.*[a-zA-Z])[a-zA-Z0-9_-]+$';
    // final regExp = RegExp(pattern);

    if (value.isEmpty) {
      return msg1;
    } else if (value.length <= 1) {
      return msg2;
    }
    /* else if (!regExp.hasMatch(value)) {
      return msg3;
    } */

    return null;
  }

  static String capitalize(String s) {
    if (s == "") {
      return "";
    } else {
      return s[0].toUpperCase() + s.substring(1);
    }
  }
}
