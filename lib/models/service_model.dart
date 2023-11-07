
import 'dart:convert';

class ServiceModel {
  final String image;
  final String title;
  final double price;
  final double offerPrice;
  const ServiceModel(
      {required this.title,
      required this.image,
      required this.price,
      required this.offerPrice});

  factory ServiceModel.fromMap(Map<String, dynamic> data) {
    return ServiceModel(
        title: data['title'],
        image: data['image'],
        price: data['price'] as double,
        offerPrice: data['offerPrice'] as double);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'title': title,
      'price': price,
      'offerPrice': offerPrice,
    };
  }

  String toJson() => json.encode(toMap());

  factory ServiceModel.fromJson(String source) =>
      ServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
