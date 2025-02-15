import 'package:trendy_fashion/model/Category.dart';

class Categoryresponse {
  int? status;
  String? message;
  List<Category>? data;

  Categoryresponse({this.status, this.message, this.data});

  Categoryresponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = List<Category>.from(json['data'].map((item) => Category.fromJson(item)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data?.map((category) => category.toJson()).toList();
    return data;
  }
}
