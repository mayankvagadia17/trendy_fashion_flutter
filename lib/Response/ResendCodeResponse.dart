import 'package:trendy_fashion/model/User.dart';

class Resendcoderesponse {
  int? status;
  String? message;
  User? data;

  Resendcoderesponse({this.status, this.message, this.data});

  Resendcoderesponse.fromJson(Map<String, dynamic> json) {
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
