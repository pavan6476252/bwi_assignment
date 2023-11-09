import 'dart:ui';

import 'package:bwi_assignment/providers/offers_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LatestOffersCarousel extends StatefulWidget {
  const LatestOffersCarousel({super.key});

  @override
  State<LatestOffersCarousel> createState() => _LatestOffersCarouselState();
}

class _LatestOffersCarouselState extends State<LatestOffersCarousel> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Consumer<OffersProvider>(builder: (context, ref, child) {
      if (ref.getIsSuccess) {
        Future.delayed(
            const Duration(seconds: 1),
            () => {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Success"),
                    backgroundColor: Colors.greenAccent,
                  ))
                });
      }
      if (ref.isError) {
        Future.delayed(
            const Duration(seconds: 1),
            () => {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(ref.getErrorMsg),
                    backgroundColor: Colors.redAccent,
                  ))
                });
      }
      if (ref.isLoading) {
        return Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: const Color.fromARGB(255, 235, 235, 235),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            height: 200,
            width: double.maxFinite,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      }
// return Text(ref.getOffers.length.toString());
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
                  for (int i = 0; i < ref.getOffers.length; i++)
                    Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            ref.getOffers[i].image,
                            fit: BoxFit.cover,
                            color: Colors.black.withOpacity(0.3),
                            colorBlendMode: BlendMode.overlay,
                          ),
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 0.5,
                            sigmaY: 0.5,
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
                                      color:
                                          const Color.fromARGB(255, 57, 74, 66),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    "${ref.getOffers[i].discount}% OFF",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  ref.getOffers[i].title,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  ref.getOffers[i].subtitle,
                                  style: const TextStyle(
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
                        count: ref.getOffers.length,
                        effect: const WormEffect(
                          dotColor: Colors.white,
                          dotHeight: 8,
                          dotWidth: 8,
                          activeDotColor: Colors.blueAccent,
                        ),
                        onDotClicked: (index) {}),
                  ))
            ],
          ));
    });
  }
}
