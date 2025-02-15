import '../model/Product.dart';

class Productresponse {
  int? status;
  String? message;
  List<Product>? data;

  Productresponse({this.status, this.message, this.data});

  Productresponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = List<Product>.from(
          json['data'].map((item) => Product.fromJson(item)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data?.map((Product) => Product.toJson()).toList();
    return data;
  }
}
