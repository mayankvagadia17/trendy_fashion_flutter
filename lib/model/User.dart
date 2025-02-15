class User {
  String? name;
  String? email;
  String? country;
  String? token;

  User({this.name, this.email, this.country, this.token});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    country = json['country'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['country'] = country;
    data['token'] = token;
    return data;
  }
}
