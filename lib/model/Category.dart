class Category {
  String? categoryName;
  bool? isPremium;
  String? categoryIcon;
  int? categoryId;

  Category({this.categoryName, this.isPremium, this.categoryIcon, this.categoryId});

  Category.fromJson(Map<String, dynamic> json) {
    categoryName = json['categoryName'];
    isPremium = json['isPremium'];
    categoryIcon = json['categoryIcon'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryName': categoryName,
      'isPremium': isPremium,
      'categoryIcon': categoryIcon,
      'categoryId': categoryId,
    };
  }
}
