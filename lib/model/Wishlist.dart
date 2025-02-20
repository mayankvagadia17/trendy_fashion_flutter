class Wishlist {
  int? userId;
  int? productId;
  int? wishlistId;
  String? createdAt;
  String? updatedAt;

  Wishlist({
    this.userId,
    this.productId,
    this.wishlistId,
    this.createdAt,
    this.updatedAt,
  });

  Wishlist.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    productId = json['productId'];
    wishlistId = json['wishlistId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['productId'] = productId;
    data['wishlistId'] = wishlistId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
