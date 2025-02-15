import 'package:trendy_fashion/model/ProductStock.dart';

class Product {
  String? name;
  int? price;
  String? description;
  bool? isPremium;
  String? category;
  int? rating;
  int? rating_count;
  String? gender;
  String? createdAt;
  String? updatedAt;
  Productstock? stock;
  List<String>? images;
  int? productId;
  int? discount;
  int? finalPrice;

  Product(
      {this.stock,
      this.images,
      this.name,
      this.price,
      this.description,
      this.isPremium,
      this.category,
      this.rating,
      this.rating_count,
      this.gender,
      this.productId,
      this.createdAt,
      this.updatedAt,
      this.discount,
      this.finalPrice});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    description = json['description'];
    isPremium = json['isPremium'];
    category = json['category'];
    rating = json['rating'];
    rating_count = json['rating_count'];
    gender = json['gender'];
    productId = json['productId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    discount = json['discount'];
    finalPrice = json['finalPrice'];
    if (json['stock'] != null) {
      stock = Productstock.fromJson(json['stock']);
    }
    if (json['images'] != null) {
      images = List<String>.from(json['images']);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'isPremium': isPremium,
      'category': category,
      'rating': rating,
      'rating_count': rating_count,
      'gender': gender,
      'productId': productId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'discount': discount,
      'finalPrice': finalPrice,
      'stock': stock?.toJson(),
      'images': images,
    };
  }
}
