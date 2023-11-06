import 'dart:ui';

import 'package:bwi_assignment/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LatestOffersCarousel extends StatefulWidget {
  const LatestOffersCarousel({super.key});

  @override
  State<LatestOffersCarousel> createState() => _LatestOffersCarouselState();
}

class _LatestOffersCarouselState extends State<LatestOffersCarousel> {
  PageController controller = PageController();
  List<String> images = [
    "https://img.freepik.com/free-vector/special-offer-creative-sale-banner-design_1017-16284.jpg?1",
    "https://img.freepik.com/free-vector/special-offer-modern-sale-banner-template_1017-20667.jpg",
    "https://img.freepik.com/free-vector/special-offer-creative-sale-banner-design_1017-16284.jpg?1",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      height: 200,
      width: double.maxFinite,
      child: Stack(
        fit: StackFit.expand,
        children: [
          PageView(
            controller: controller,
            children: [
              for (int i = 0; i < images.length; i++)
                Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        images[i],
                        fit: BoxFit.cover,
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 1.0,
                        sigmaY: 1.0,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 57, 74, 66),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text(
                                "30% OFF",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Today's Special",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const Text(
                              "Get a discountfor every service order!\nonly valid for today!",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            ],
          ),
          // page indicator
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const WormEffect(
                      dotColor: Colors.white,
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: Colors.blueAccent,
                    ),
                    onDotClicked: (index) {}),
              ))
        ],
      ),
    );
  }
}
