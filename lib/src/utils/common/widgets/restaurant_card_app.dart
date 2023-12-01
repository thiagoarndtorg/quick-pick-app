import 'package:flutter/material.dart';

import 'package:quick_pick_app/src/utils/app_colors.dart';
import 'package:quick_pick_app/src/utils/common/domain/restaurant_model.dart';

import 'package:quick_pick_app/src/utils/common/mixins/image_data_mixin.dart';

class RestaurantCardApp extends StatefulWidget {
  final RestaurantModel restaurantModel;
  const RestaurantCardApp({super.key, required this.restaurantModel});

  @override
  State<RestaurantCardApp> createState() => _RestaurantCardAppState();
}

class _RestaurantCardAppState extends State<RestaurantCardApp> with ImageDataMixin {
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
              FutureBuilder(
                future: validateImage(widget.restaurantModel.menu!.image!),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    bool item = snapshot.data!;
                    return item
                        ? Container(
                            width: 70,
                            height: 70,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: Image.network(
                                fit: BoxFit.cover,
                                widget.restaurantModel.menu!.image!,
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                            ),
                            width: 70,
                            height: 70,
                          );
                  }
                  return Container(
                    width: 70,
                    height: 70,
                    color: Colors.grey,
                  );
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.restaurantModel.name ?? '',
                    textScaleFactor: 1.2,
                    style: TextStyle(color: appColorTitle, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 110,
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      strutStyle: StrutStyle(fontSize: 12.0),
                      text: TextSpan(
                        style: TextStyle(color: appColorDescription),
                        text: widget.restaurantModel.description ?? '',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            '0 na fila',
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
