class Productstock {
  int? S;
  int? M;
  int? L;
  int? XL;
  int? XXL;

  Productstock({this.S, this.M, this.L, this.XL, this.XXL});

  Productstock.fromJson(Map<String, dynamic> json) {
    S = json['S'];
    M = json['M'];
    L = json['L'];
    XL = json['XL'];
    XXL = json['XXL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['S'] = S;
    data['M'] = M;
    data['L'] = L;
    data['XL'] = XL;
    data['XXL'] = XXL;
    return data;
  }
}
