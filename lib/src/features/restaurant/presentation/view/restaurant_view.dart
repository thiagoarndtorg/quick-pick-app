import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/routes/app_router.gr.dart';
import 'package:quick_pick_app/src/features/restaurant/application/restaurant_controller.dart';
import 'package:quick_pick_app/src/features/restaurant/data/model/restaurant_model.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';
import 'package:quick_pick_app/src/utils/common/domain/restaurant_model.dart';
import 'package:quick_pick_app/src/utils/common/mixins/image_data_mixin.dart';
import 'package:quick_pick_app/src/utils/common/widgets/app_bar_app.dart';
import 'package:quick_pick_app/src/utils/common/widgets/food_card_app.dart';
import 'package:quick_pick_app/src/utils/common/widgets/text_field_app.dart';

class RestaurantView extends StatefulWidget {
  final int restaurantId;
  const RestaurantView({super.key, required this.restaurantId});

  @override
  State<RestaurantView> createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> with ImageDataMixin {
  TextEditingController searchTextController = TextEditingController();

  RestaurantController _restaurantController = RestaurantController();
  List<FoodModel> items = [];
  List<FoodModel> duplicateItems = [];
  Future<List<FoodModel>>? futureList;
  RestaurantModel? menuModel;
  void filterSearchResults(
    String query,
  ) {
    setState(() {
      items = duplicateItems.where((item) => item.foodName!.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getRestaurant();
    });
    futureList = _restaurantController.getFoods(widget.restaurantId.toString());
    super.initState();
  }

  void _getRestaurant() async {
    menuModel = await _restaurantController.getRestaurant(widget.restaurantId.toString());

    setState(() {});
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appColorBackground,
        resizeToAvoidBottomInset: true,
        appBar: AppBarApp(onBackPressed: () => context.router.pop()),
        body: FutureBuilder(
            future: futureList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (items.isEmpty && duplicateItems.isEmpty) {
                  items = snapshot.data!;
                  duplicateItems = items;
                }
                return CustomScrollView(
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
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius: BorderRadius.all(Radius.circular(10))),
                                                  width: 100,
                                                  height: 100,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(8.0),
                                                    child: menuModel?.menu?.image != null
                                                        ? Image.network(
                                                            fit: BoxFit.cover,
                                                            menuModel!.menu!.image!,
                                                          )
                                                        : Container(
                                                            color: Colors.grey,
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
                                                        menuModel != null ? menuModel!.name ?? '' : 'Carregando...',
                                                        textScaleFactor: 1.4,
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      Container(
                                                        width: 110,
                                                        child: RichText(
                                                          overflow: TextOverflow.ellipsis,
                                                          strutStyle: StrutStyle(fontSize: 12.0),
                                                          text: TextSpan(
                                                            style: TextStyle(color: appColorDescription),
                                                            text: menuModel != null
                                                                ? menuModel!.description ?? ''
                                                                : 'Carregando...',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 30),
                                              child: Text('0 na fila', style: TextStyle(color: appColorDescription)),
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
                                onChanged: ((p0) => filterSearchResults(p0)),
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
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  FoodModel item = items[index];
                                  return GestureDetector(
                                    onTap: () async {
                                      print(item);
                                      await context.router.navigate(FoodMain(foodId: item.foodId!));
                                    },
                                    child: FoodCardApp(
                                      item: item,
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Center(
                  child: Column(
                children: [
                  CircularProgressIndicator(),
                ],
              ));
            }));
  }
}
