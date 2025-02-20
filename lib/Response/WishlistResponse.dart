import 'package:trendy_fashion/model/Wishlist.dart';

class WishlistResponse {
  int? status;
  String? message;
  List<Wishlist>? data;

  WishlistResponse({this.status, this.message, this.data});

  WishlistResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = List<Wishlist>.from(
          json['data'].map((item) => Wishlist.fromJson(item)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data?.map((Wishlist) => Wishlist.toJson()).toList();
    return data;
  }
}
