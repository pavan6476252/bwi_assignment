// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SaloonModel {
  final String image;
  final String title;
  final String address;
  final String distance;
  final double rantings;
  final double reviews;

  SaloonModel(
      {required this.image,
      required this.title,
      required this.address,
      required this.distance,
      required this.rantings,
      required this.reviews});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'title': title,
      'address': address,
      'distance': distance,
      'rantings': rantings,
      'reviews': reviews,
    };
  }

  factory SaloonModel.fromMap(Map<String, dynamic> map) {
    return SaloonModel(
      image: map['image'] as String,
      title: map['title'] as String,
      address: map['address'] as String,
      distance: map['distance'] as String,
      rantings: map['rantings'] as double,
      reviews: map['reviews'] as double,
    );
  }

  String toJson() => json.encode(toMap());
}
