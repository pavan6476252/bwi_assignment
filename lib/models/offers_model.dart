// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class OffersModel {
  final double discount;
  final String title;
  final String subtitle;
  final String image;
  OffersModel({
    required this.discount,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'discount': discount,
      'title': title,
      'subtitle': subtitle,
      'image': image,
    };
  }

  factory OffersModel.fromMap(Map<String, dynamic> map) {
    return OffersModel(
      discount: map['discount'] as double,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OffersModel.fromJson(String source) => OffersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  OffersModel copyWith({
    double? discount,
    String? title,
    String? subtitle,
    String? image,
  }) {
    return OffersModel(
      discount: discount ?? this.discount,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      image: image ?? this.image,
    );
  }
}
