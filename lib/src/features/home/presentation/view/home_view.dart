import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';
import 'package:quick_pick_app/src/utils/common/domain/user_model.dart';
import 'package:quick_pick_app/src/utils/common/mixins/user_hive_mixin.dart';
import 'package:quick_pick_app/src/utils/common/widgets/status_card_app.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with UserHiveMixin {
  UserModel? userData;
  @override
  void initState() {
    userData = getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        // direction: Axis.vertical,
        //spacing: 150,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 5,
              children: [
                Text(
                  'Bem vindo, ${userData?.userName}! 👋',
                  textScaleFactor: 1.8,
                  style: TextStyle(color: appColorTitle, fontWeight: FontWeight.w600),
                ),
                Text(
                  'O que você vai pedir hoje?',
                  textScaleFactor: 1.2,
                  style: TextStyle(color: appColorDescription),
                ),
              ],
            ),
          ),
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
          SizedBox(height: 30),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(left: 20, right: 45),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: appColorLightGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20);
                },
                itemBuilder: (context, index) {
                  return StatusCardApp();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
