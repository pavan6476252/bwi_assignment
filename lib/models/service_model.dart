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
}
