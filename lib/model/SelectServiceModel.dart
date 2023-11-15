import 'package:get/get.dart';

class SelectServiceModel {
  SelectServiceModel({
      this.id, 
      this.title, 
      this.slug,
    this.price,
    this.currencyCode
  });

  SelectServiceModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    currencyCode = json['currency_code'];

  }
  int? id;
  String? title;
  String? slug;
  int? price;
  String? currencyCode;
  var isSelected = false.obs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['price'] = price;
    map['currency_code'] = currencyCode;
    return map;
  }

}