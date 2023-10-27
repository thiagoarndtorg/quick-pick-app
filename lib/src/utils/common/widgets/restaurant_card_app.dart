import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/features/search/data/models/menu_model.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';

import 'package:quick_pick_app/src/utils/common/mixins/image_data_mixin.dart';

class RestaurantCardApp extends StatefulWidget {
  final MenuModel menuModel;
  const RestaurantCardApp({super.key, required this.menuModel});

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
                future: validateImage(widget.menuModel.image!),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    bool item = snapshot.data!;
                    return item
                        ? Image.network(
                            widget.menuModel.image!,
                            width: 70,
                            height: 70,
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
                    widget.menuModel.name ?? '',
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
                        text: widget.menuModel.description ?? '',
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
