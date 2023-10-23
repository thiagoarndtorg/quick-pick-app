import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';

class RestaurantCardApp extends StatelessWidget {
  const RestaurantCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            runSpacing: 10,
            spacing: 8,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Image.asset(
                'assets/images/kalzone_image.png',
                width: 70,
                height: 70,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kalzone',
                    textScaleFactor: 1.2,
                    style: TextStyle(color: appColorTitle, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Shopping Muller',
                    style: TextStyle(color: appColorDescription),
                  ),
                ],
              ),
            ],
          ),
          Text(
            '24 pessoas na fila',
            style: TextStyle(fontWeight: FontWeight.bold, color: appColorDescription),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 80,
    );
  }
}
