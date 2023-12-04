import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/features/food/data/model/food_model.dart';

import 'package:quick_pick_app/src/utils/app_colors.dart';
import 'package:quick_pick_app/src/utils/common/mixins/image_data_mixin.dart';

class FoodCardApp extends StatefulWidget {
  final FoodModel item;
  const FoodCardApp({super.key, required this.item});

  @override
  State<FoodCardApp> createState() => _FoodCardAppState();
}

class _FoodCardAppState extends State<FoodCardApp> with ImageDataMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          FutureBuilder(
            future: validateImage(widget.item.foodImage!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                bool item = snapshot.data!;
                return item
                    ? Container(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.network(
                            fit: BoxFit.cover,
                            widget.item.foodImage!,
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
                  widget.item.foodName ?? '',
                  textScaleFactor: 1.2,
                  style: TextStyle(color: appColorTitle, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.item.foodDescription ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  softWrap: false,
                  style: TextStyle(color: appColorDescription),
                ),
                Text(
                  'R\$' + widget.item.foodPrice.toString(),
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
