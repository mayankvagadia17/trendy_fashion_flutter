import 'package:trendy_fashion/model/User.dart';

class Loginresponse {
  int? status;
  String? message;
  User? data;

  Loginresponse({this.status, this.message, this.data});

  Loginresponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = User.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data!.toJson();
    return data;
  }
}