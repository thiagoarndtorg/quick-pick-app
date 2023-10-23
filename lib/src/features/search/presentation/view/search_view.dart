import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/routes/app_router.gr.dart';

import 'package:quick_pick_app/src/utils/common/widgets/filter_card_app.dart';
import 'package:quick_pick_app/src/utils/common/widgets/restaurant_card_app.dart';
import 'package:quick_pick_app/src/utils/common/widgets/text_field_app.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextFieldApp(
              title: 'Pesquisar',
              icon: FeatherIcons.search,
              inputType: TextInputType.text,
              controller: textController,
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 30,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (context, index) {
                return SizedBox(width: 20);
              },
              itemBuilder: (context, index) {
                return FilterCardApp(
                  title: 'Kalzone',
                  isSelected: index == 0 ? true : false,
                );
              },
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
                enlargeFactor: 0.015,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: 350,
                      padding: const EdgeInsets.all(20),
                      decoration: ShapeDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage('assets/images/waffles2.png'),
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
                            'Café da manhã',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0.06,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '50% de desconto durante a manhã',
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
              itemCount: 10,
              separatorBuilder: (context, index) {
                return SizedBox(height: 20);
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async => await context.router.navigate(RestaurantMain(restaurantId: index)),
                  child: RestaurantCardApp(),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
