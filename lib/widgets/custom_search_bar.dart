import 'package:bwi_assignment/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: TextFormField(
            decoration: InputDecoration(
              
              hintText: "Search",
              hintStyle: TextStyle(color: AppColors.lightGray),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.lightGray,
                ),
                border: InputBorder.none),
          )),
          Icon(
            Icons.tune,
            color: AppColors.lightGray,
          )
        ],
      ),
    );
  }
}
