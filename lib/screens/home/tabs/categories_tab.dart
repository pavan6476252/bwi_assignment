import 'package:bwi_assignment/providers/categories_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../models/category_model.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});
  final String img =
      'https://cdn1.iconfinder.com/data/icons/amenities-solid-ii/48/_beauty-salon2-512.png';

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
      // if (ref.isLoading) {
      //   return Center(
      //     child: CircularProgressIndicator(),
      //   );
      // }

      return SingleChildScrollView(
        child: Column(
          children: [

            ref.isLoading ? 
               GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 2 / 3),
                  itemBuilder: (context, index) {
           
                    return Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Color.fromARGB(255, 235, 235, 235),
                      child: Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 8),
                      ),
                    );
                  })
            
            :
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ref.getCategories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 2 / 3),
              itemBuilder: (context, index) {
                CategoryModel categoryModel = ref.getCategories[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Container(
                              // decoration: BoxDecoration(
                              //   image: DecorationImage(
                              //       image: NetworkImage(categoryModel.image),fit: BoxFit.cover),
                              //   color: Colors.amber,
                              //   borderRadius: BorderRadius.circular(8),
                              // ),
                              child: CachedNetworkImage(
                            imageUrl:
                                'https://img.freepik.com/premium-vector/hair-salon-logo-design-crown-salon_290562-205.jpg?w=740',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor:
                                  Color.fromARGB(255, 235, 235, 235),
                              child: Container(
                                  // color: Colors.amber,
                                  ),
                            ),
                          ))),
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                categoryModel.title,
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
    });
  }
}
