import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../widget/appWidget/parameterString.dart';
import '../widget/appWidget/sharedPreferances.dart';
import 'Constant.dart';

class ApiException implements Exception {
  ApiException(this.errorMessage);

  String errorMessage;

  @override
  String toString() {
    return errorMessage;
  }
}

class ApiBaseHelper {
  Future<dynamic> postAPICall(Uri url, Map<String, String> parameter) async {
    dynamic responseJson;
    var token = "Bearer ${await getPrefrence(accessToken)}";
    try {
      final Uri uri = url.replace(queryParameters: parameter);
      final response = await post(
        uri,
        body: null,
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      ).timeout(
        const Duration(
          seconds: timeOut,
        ),
      );

      responseJson = response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Something went wrong, try again later');
    }
    return responseJson;
  }

  Future<dynamic> postApiCallFormated(Uri url, Map<String, String> parameter) async {
    dynamic responseJson;
    var token = "Bearer ${await getPrefrence(accessToken)}";
    try {
      final Uri uri = url.replace(queryParameters: parameter);
      final response = await post(
        uri,
        body: null,
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      ).timeout(
        const Duration(
          seconds: timeOut,
        ),
      );

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Something went wrong, try again later');
    }
    return responseJson;
  }

  Future<dynamic> getAPICall(Uri url) async {
    dynamic responseJson;


    var token = "Bearer ${await getPrefrence(accessToken)}";
    try {
      final response = await get(
        url,
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      ).timeout(
        const Duration(
          seconds: timeOut,
        ),
      );

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Something went wrong, try again later');
    }
    return responseJson;
  }

  Future<dynamic> getAPICallWithParam(Uri url,Map<String, String> parameter) async {
    dynamic responseJson;
      var token = "Bearer ${await getPrefrence(accessToken)}";
    final Uri uri = url.replace(queryParameters: parameter);
    try {
      final response = await get(
        uri,
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      ).timeout(
        const Duration(
          seconds: timeOut,
        ),
      );

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Something went wrong, try again later');
    }
    return responseJson;
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }
}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([message]) : super(message, "Invalid Input: ");
}
