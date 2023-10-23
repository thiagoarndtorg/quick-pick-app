import 'package:auto_route/auto_route.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';
import 'package:quick_pick_app/src/utils/common/widgets/app_bar_app.dart';
import 'package:quick_pick_app/src/utils/common/widgets/food_card_app.dart';
import 'package:quick_pick_app/src/utils/common/widgets/text_field_app.dart';

class RestaurantView extends StatefulWidget {
  final int restaurantId;
  const RestaurantView({super.key, required this.restaurantId});

  @override
  State<RestaurantView> createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> {
  TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appColorBackground,
        resizeToAvoidBottomInset: true,
        appBar: AppBarApp(onBackPressed: () => context.router.pop()),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: true,
              child: Container(
                height: MediaQuery.of(context).size.height - 120,
                child: Column(
                  children: [
                    Container(
                      height: 170,
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.red,
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                          ),
                          Positioned(
                            top: 40,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 40,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/kalzone_image.png',
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 15),
                                          child: Wrap(
                                            direction: Axis.vertical,
                                            children: [
                                              Text(
                                                'Kalzone',
                                                textScaleFactor: 1.4,
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              Text('Shopping Muller'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 30),
                                      child: Text('24 na fila', style: TextStyle(color: appColorDescription)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFieldApp(
                        title: 'Pesquisar',
                        icon: FeatherIcons.search,
                        inputType: TextInputType.text,
                        controller: searchTextController,
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 30);
                        },
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return FoodCardApp();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
