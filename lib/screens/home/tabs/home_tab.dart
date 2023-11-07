import 'package:bwi_assignment/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_search_bar.dart';
import '../../../widgets/featured_services_list.dart';
import '../../../widgets/latest_offers_carousel.dart';
import '../widgets/categories_grid.dart';
import '../widgets/most_popular_services.dart';

class HomeTab extends StatelessWidget {
  final VoidCallback switchToCategoriesTab;
  const HomeTab({super.key, required this.switchToCategoriesTab});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: CustomSearchBar(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: LatestOffersCarousel(),
          ),
          const FeaturedServicesList(),
          CategoriesGrid(viewMore: switchToCategoriesTab),
          const MostPopularServices(),
        ],
      ),
    );
  }
}
