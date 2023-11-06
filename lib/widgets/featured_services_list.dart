import 'package:bwi_assignment/models/service_model.dart';
import 'package:flutter/material.dart';

class FeaturedServicesList extends StatefulWidget {
  const FeaturedServicesList({super.key ,  });
  @override
  State<FeaturedServicesList> createState() => _FeaturedServicesListState();
}

class _FeaturedServicesListState extends State<FeaturedServicesList> {
  @override
  Widget build(BuildContext context) {
    List<ServiceModel> data = [
      const ServiceModel(
          title: "Beard trimming",
          image:
              "https://img.freepik.com/free-vector/special-offer-creative-sale-banner-design_1017-14284.jpg?1",
          offerPrice: 200,
          price: 300),
      const ServiceModel(
          title: "Hair Strightener",
          image:
              "https://img.freepik.com/free-vector/special-offer-modern-sale-banner-template_1017-20667.jpg",
          offerPrice: 1000,
          price: 2100),
      const ServiceModel(
          title: "Splendier",
          image:
              "https://img.freepik.com/free-vector/special-offer-modern-sale-banner-template_1017-20667.jpg",
          offerPrice: 1000,
          price: 1500),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            "Featured Services",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 220,
          width: double.maxFinite,
          child: Center(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: index == 0 ? 15 : 4, top: 4, right: 10, bottom: 4),
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 0, blurRadius: 2, color: Colors.grey)
                      ]),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.network(
                          data[index].image,
                          height: 150,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                data[index].title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                                maxLines: 1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    data[index].price.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    data[index].price.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[400],
                                        fontSize: 14,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
