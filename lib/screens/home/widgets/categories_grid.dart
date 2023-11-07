import 'package:bwi_assignment/models/category_model.dart';
import 'package:bwi_assignment/providers/categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesGrid extends StatefulWidget {
  final VoidCallback? viewMore;

  const CategoriesGrid({super.key, this.viewMore});

  @override
  State<CategoriesGrid> createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  @override
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, ref, child) {
      if (ref.getIsSuccess) {
        Future.delayed(
            Duration(seconds: 1),
            () => {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Success"),
                    backgroundColor: Colors.greenAccent,
                  ))
                });
      }
      if (ref.isError) {
        Future.delayed(
            Duration(seconds: 1),
            () => {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(ref.getErrorMsg),
                    backgroundColor: Colors.redAccent,
                  ))
                });
      }
      if (ref.isLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
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
              CategoryModel categoryModel = ref.getCategories[index];
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
                            image: DecorationImage(
                                image: NetworkImage(categoryModel.image),
                                fit: BoxFit.cover),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              categoryModel.title.length > 10
                                  ? "${categoryModel.title.substring(0, 14)}..."
                                  : categoryModel.title,
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
    });
  }
}
