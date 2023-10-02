import 'package:auto_route/auto_route.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import 'package:quick_pick_app/routes/app_router.gr.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

@RoutePage()
class BottomNavigationMain extends StatefulWidget {
  const BottomNavigationMain({super.key});

  @override
  State<BottomNavigationMain> createState() =>
      _BottomNavigationMainState();
}

class _BottomNavigationMainState extends State<BottomNavigationMain> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        HomeMain(),
        SearchMain(),
        OrdersMain(),
        ProfileMain(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              icon: Icon(FeatherIcons.home),
              title: Text('mama'),
            ),
            SalomonBottomBarItem(
              icon: Icon(FeatherIcons.search),
              title: Text('mama'),
            ),
            SalomonBottomBarItem(
              icon: Icon(FeatherIcons.shoppingBag),
              title: Text('mama'),
            ),
            SalomonBottomBarItem(
              icon: Icon(FeatherIcons.user),
              title: Text('mama'),
            ),
          ],
        );
      },
    );
  }
}
