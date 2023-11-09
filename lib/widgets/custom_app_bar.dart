import 'package:bwi_assignment/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return ListTile(
      leading: SizedBox(
        width: 40,
        height: 40,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              "https://i.pinimg.com/474x/2e/2f/ac/2e2fac9d4a392456e511345021592dd2.jpg",
              fit: BoxFit.cover,
            )),
      ),
      title: Text(
        "Good Morning",
        style: textTheme.bodySmall!
            .copyWith(color: AppColors.lightGray, fontWeight: FontWeight.w400),
      ),
      subtitle: Text(
        "Sushma Shukla",
        style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.notifications_none,
            size: 30,
          ),
          SizedBox(width: 10),
          Icon(
            Icons.book,
            size: 30,
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight+10);
}


  // appBar: AppBar(
  //       title: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             "Good Morning",
  //             style: textTheme.bodyMedium!.copyWith(
  //                 color: const Color.fromARGB(255, 98, 97, 97),
  //                 fontWeight: FontWeight.w400),
  //           ),
  //           Text(
  //             "Sushma Shukla",
  //             style:
  //                 textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
  //           ),
  //         ],
  //       ),
  //       actions: [
  //         Icon(
  //           Icons.notifications_none,
  //           size: 30,
  //         ),
  //         SizedBox(width: 10),
  //         Icon(
  //           Icons.book,
  //           size: 30,
  //         ),
  //         SizedBox(width: 10),
  //       ],
  //       leading: ClipRRect(
  //           borderRadius: BorderRadius.circular(50),
  //           child: Image.network(
  //             "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  //             fit: BoxFit.cover,
  //           )),
  //     ),
     