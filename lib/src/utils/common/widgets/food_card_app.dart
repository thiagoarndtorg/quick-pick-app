import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';

class FoodCardApp extends StatelessWidget {
  const FoodCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              'assets/images/food.png',
              width: 120,
              height: 120,
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width - 210,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.start,
              runSpacing: 10,
              children: [
                Text(
                  'Kalzone',
                  textScaleFactor: 1.2,
                  style: TextStyle(color: appColorTitle, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nulla justo, tincidunt sed ipsum nec, pellentesque malesuada diam. Quisque a diam ultrices, venenatis odio vehicula, gravida nisi.',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  softWrap: false,
                  style: TextStyle(color: appColorDescription),
                ),
                Text(
                  'R\$ 24,00',
                  textScaleFactor: 1.2,
                  style: TextStyle(color: appColorTitle, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
    );
  }
}
