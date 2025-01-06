import 'package:trendy_fashion/model/User.dart';

class Createprofileresponse {
  int? status;
  String? message;
  User? data;

  Createprofileresponse({this.status, this.message, this.data});

  Createprofileresponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = User.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data!.toJson();
    return data;
  }
}