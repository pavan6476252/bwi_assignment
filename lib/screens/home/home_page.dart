import 'package:bwi_assignment/screens/home/tabs/calendar_tab.dart';
import 'package:bwi_assignment/screens/home/tabs/categories_tab.dart';
import 'package:bwi_assignment/screens/home/tabs/home_tab.dart';
import 'package:bwi_assignment/screens/home/tabs/messagin_tab.dart';
import 'package:bwi_assignment/screens/home/tabs/profile_tab.dart';
import 'package:bwi_assignment/screens/home/widgets/categories_grid.dart';
import 'package:bwi_assignment/utils/colors.dart';
import 'package:bwi_assignment/widgets/custom_app_bar.dart';
import 'package:bwi_assignment/widgets/custom_search_bar.dart';
import 'package:bwi_assignment/widgets/featured_services_list.dart';
import 'package:bwi_assignment/widgets/latest_offers_carousel.dart';
import 'package:flutter/material.dart';

import 'widgets/most_popular_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 246, 246, 246),
          appBar: const CustomAppbar(),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: AppColors.bluegrey, spreadRadius: 1)
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.only(),
            ),
            height: 66, // Adjust the height as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNavItem(0, "Home", (Icons.home_filled)),
                buildNavItem(1, "Learn", (Icons.grid_view_outlined)),
                buildNavItem(2, "Hub", (Icons.calendar_month_rounded)),
                buildNavItem(3, "Chat", (Icons.chat_outlined)),
                buildNavItem(4, "User", (Icons.person_outline)),
              ],
            ),
          ),
          body: [
            HomeTab(
              switchToCategoriesTab: () {
                _currentIndex = 1;
                setState(() {});
              },
            ),
            const CategoriesTab(),
            const CalendatTab(),
            const MessagingTab(),
            const ProfileTab(),
          ][_currentIndex]),
    );
  }

  Widget buildNavItem(int index, String title, IconData icon) {
    final iconColor = index == _currentIndex ? Colors.blue : Colors.grey;

    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: index == _currentIndex
                  ? const Color.fromARGB(255, 9, 71, 104)
                  : Colors.white,
              width: 2,
            ),
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () => changeTab(index),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: _currentIndex == index
                    ? const Color.fromARGB(255, 9, 71, 104)
                    : null,
              )
              // Text(
              //   title,
              //   style: TextStyle(
              //     color: index == _currentIndex ? Colors.blue : Colors.grey,
              //     fontWeight: index == _currentIndex
              //         ? FontWeight.bold
              //         : FontWeight.w400,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  changeTab(int index) {
    setState(() {
      if (index != _currentIndex) {
        setState(() {
          _currentIndex = index;
        });
      }
    });
  }
}
