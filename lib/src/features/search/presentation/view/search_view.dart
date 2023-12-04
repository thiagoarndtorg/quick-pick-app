import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/routes/app_router.gr.dart';

import 'package:quick_pick_app/src/utils/common/domain/menu_model.dart';
import 'package:quick_pick_app/src/utils/common/domain/restaurant_model.dart';

import 'package:quick_pick_app/src/utils/common/widgets/filter_card_app.dart';
import 'package:quick_pick_app/src/utils/common/widgets/restaurant_card_app.dart';
import 'package:quick_pick_app/src/utils/common/widgets/text_field_app.dart';
import 'package:quick_pick_app/src/features/search/application/search_controller.dart' as search;

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController textController = TextEditingController();

  search.SearchController _searchController = search.SearchController();

  List<RestaurantModel> items = [];
  List<RestaurantModel> duplicateItems = [];

  void filterSearchResults(
    String query,
  ) {
    setState(() {
      items = duplicateItems.where((item) => item.name!.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  Future<List<RestaurantModel>>? itemsFuture;

  @override
  void initState() {
    itemsFuture = _searchController.getRestaurants();

    super.initState();
  }

  List<dynamic> list = [
    {
      'name': 'Macarrão saboroso',
      'desc': '10% de desconto fim de semana',
      'image': 'food1.jpg',
    },
    {
      'name': 'Bolo delicioso',
      'desc': '50% de desconto durante semana',
      'image': 'food2.jpg',
    },
    {
      'name': 'Rocamboli divíno',
      'desc': '20% de desconto terças-feiras',
      'image': 'food3.jpg',
    },
    {
      'name': 'Almoço completo',
      'desc': 'Leve uma coca-cola de brinde',
      'image': 'food4.jpg',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemsFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (items.isEmpty && duplicateItems.isEmpty) {
            items = snapshot.data as List<RestaurantModel>;
            duplicateItems = items;
          }

          return Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFieldApp(
                    onChanged: ((p0) => filterSearchResults(p0)),
                    title: 'Pesquisar',
                    icon: FeatherIcons.search,
                    inputType: TextInputType.text,
                    controller: textController,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 170.0,
                      autoPlay: false,
                      aspectRatio: 1,
                      viewportFraction: 0.9,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.2,
                    ),
                    items: list.map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: 350,
                            padding: const EdgeInsets.all(20),
                            decoration: ShapeDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/${item['image']}'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstIn)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 0.06,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  item['desc'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0.08,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: items.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 20);
                          },
                          itemBuilder: (context, index) {
                            RestaurantModel item = items[index];
                            return GestureDetector(
                              onTap: () async => await context.router.navigate(RestaurantMain(restaurantId: item.id!)),
                              child: RestaurantCardApp(restaurantModel: item),
                            );
                          },
                        )))
              ],
            ),
          );
        }
        return Center(
            child: Column(
          children: [
            CircularProgressIndicator(),
          ],
        ));
      },
    );
  }
}
