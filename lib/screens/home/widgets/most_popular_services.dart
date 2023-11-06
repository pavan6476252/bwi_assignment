import 'package:bwi_assignment/models/SaloonModel.dart';
import 'package:bwi_assignment/utils/colors.dart';
import 'package:flutter/material.dart';

class MostPopularServices extends StatefulWidget {
  const MostPopularServices({super.key});

  @override
  State<MostPopularServices> createState() => _MostPopularServicesState();
}

class _MostPopularServicesState extends State<MostPopularServices> {
  List<String> tabs = ["All", "Haircuts", "Make up", "Marcure", "Hair Die"];
  List<SaloonModel> services = [
    SaloonModel(
      image: 'https://saloon1.com/image1.jpg',
      title: 'Beauty Haven',
      address: '123 Main Street, Cityville',
      distance: '2.5 miles',
      rantings: 4.8,
      reviews: 120,
    ),
    SaloonModel(
      image: 'https://saloon2.com/image2.jpg',
      title: 'Glamour Glow',
      address: '456 Oak Avenue, Townsville',
      distance: '1.2 miles',
      rantings: 4.5,
      reviews: 95,
    ),
    SaloonModel(
      image: 'https://saloon3.com/image3.jpg',
      title: 'Elegance Salon',
      address: '789 Elm Street, Villagetown',
      distance: '3.0 miles',
      rantings: 4.9,
      reviews: 150,
    ),
    SaloonModel(
      image: 'https://saloon4.com/image4.jpg',
      title: 'Chic Beauty Studio',
      address: '101 Pine Road, Suburbia',
      distance: '0.8 miles',
      rantings: 4.7,
      reviews: 110,
    ),
    SaloonModel(
      image: 'https://saloon5.com/image5.jpg',
      title: 'Pure Glam Salon',
      address: '222 Cedar Lane, Metroville',
      distance: '1.5 miles',
      rantings: 4.6,
      reviews: 105,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: SizedBox(
            width: double.maxFinite,
            child: Text(
              "Most Popular Services",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 40,
          width: double.maxFinite,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: index == 0 ? 15 : 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: index == 0
                        ? AppColors.darkBlue
                        : const Color.fromARGB(122, 15, 115, 196)),
                child: Center(
                    child: Text(tabs[index],
                        style: TextStyle(
                            color: index == 0
                                ? Colors.white
                                : AppColors.darkBlue))),
              );
            },
            itemCount: tabs.length,
          ),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                          color: Colors.redAccent,
                          width: 130,
                          fit: BoxFit.cover,
                          'https://previews.123rf.com/images/redlinevector/redlinevector1710/redlinevector171000465/88339136-icon-of-beard-trim-grooming-mustache-facial-hair-hairdressing-salon-concept-can-be-used-for-topics.jpg'),
                    )
                    // info
                    ,
                    SizedBox(width: 8),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          services[index].title,
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          services[index].address,
                          maxLines: 1,
                          style: TextStyle(
                              color: AppColors.lightGray,
                              fontWeight: FontWeight.w700,
                              fontSize: 11),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.darkBlue,
                            ),
                            Text(services[index].distance)
                          ],
                          mainAxisSize: MainAxisSize.min,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            Text(
                              services[index].rantings.toString() +
                                  " | " +
                                  services[index].reviews.toString() +
                                  " Reviews",
                              maxLines: 1,
                              style: TextStyle(
                                  color: AppColors.lightGray,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    )),
                    Icon(
                      Icons.bookmark_added_outlined,
                      size: 35,
                      color: index == 0 ? Colors.redAccent : null,
                    )
                  ],
                ),
              );
            },
            itemCount: services.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
      ],
    );
  }
}
