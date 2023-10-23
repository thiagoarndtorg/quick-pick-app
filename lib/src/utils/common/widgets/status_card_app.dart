import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';

class StatusCardApp extends StatelessWidget {
  const StatusCardApp({super.key});

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
              Icon(
                FeatherIcons.checkCircle,
                color: Colors.green,
                size: 30,
              ),
              Column(
                children: [
                  Text(
                    'Pablo Lopes',
                    textScaleFactor: 1.2,
                    style: TextStyle(color: appColorTitle, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Entrega pronta',
                    style: TextStyle(color: appColorDescription),
                  ),
                ],
              ),
            ],
          ),
          Text(
            'Pronto!',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 65,
    );
  }
}
