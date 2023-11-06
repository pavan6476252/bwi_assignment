import 'package:bwi_assignment/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoriesGrid extends StatefulWidget {
  final VoidCallback? viewMore;

  const CategoriesGrid({super.key, this.viewMore});

  @override
  State<CategoriesGrid> createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  @override
  String img =
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
      CategoryModel(image: img, title: 'Beard Trimming'),
      const CategoryModel(
          image: 'https://i.imgur.com/spa.jpg', title: 'Waxing'),
      CategoryModel(image: img, title: 'Facial'),
    ];
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Categories",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                if (widget.viewMore != null) {
                  widget.viewMore!();
                }
              },
              child: const Text(
                'View All',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 3, 83, 149)),
              ),
            )
          ],
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
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
      ]),
    );
  }
}
