import 'package:flutter/material.dart';

import '../../../models/category_model.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});
  final String img =
      'https://cdn1.iconfinder.com/data/icons/amenities-solid-ii/48/_beauty-salon2-512.png';

  @override
  Widget build(BuildContext context) {
     List<CategoryModel> data = [
      CategoryModel(image: img, title: 'Hair cut'),
      const CategoryModel(
          image: 'https://i.imgur.com/makeup.jpg', title: 'Makeup'),
      CategoryModel(image: img, title: 'Straightening'),
      CategoryModel(image: img, title: 'Mani-Pedi'),
      const CategoryModel(
          image: 'https://i.imgur.com/spa.jpg', title: 'Spa/Message'),
      CategoryModel(image: img, title: 'Beard Trimming'),
      const CategoryModel(
          image: 'https://i.imgur.com/spa.jpg', title: 'Hair Coloring'),
  
      const CategoryModel(
          image: 'https://i.imgur.com/spa.jpg', title: 'Waxing'),
      CategoryModel(image: img, title: 'Facial'),
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 2 / 3),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: Column(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              data[index].title,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ))
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
