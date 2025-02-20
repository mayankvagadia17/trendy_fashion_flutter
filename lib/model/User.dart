class User {
  String? name;
  String? email;
  String? token;
  bool? isVerified;
  String? role;
  int? userId;
  String? phone;

  User({this.name, this.email, this.token, this.isVerified, this.role, this.userId, this.phone});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    token = json['token'];
    isVerified = json['isVerified'];
    role = json['role'];
    userId = json['userId'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['token'] = token;
    data['isVerified'] = isVerified;
    data['role'] = role;
    data['userId'] = userId;
    data['phone'] = phone;
    return data;
  }
}
