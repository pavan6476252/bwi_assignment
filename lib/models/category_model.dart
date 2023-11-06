class CategoryModel {
  final String title;
  final String image;
  const CategoryModel({required this.image, required this.title});

  factory CategoryModel.fromMap(Map<String, dynamic> data) {
    return CategoryModel(image: data['image'], title: data['title']);
  }
}



