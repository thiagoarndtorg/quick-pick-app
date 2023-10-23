import 'package:auto_route/auto_route.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/routes/app_router.gr.dart';
import 'package:quick_pick_app/src/utils/common/widgets/app_bar_app.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

@RoutePage()
class BottomNavigationMain extends StatefulWidget {
  const BottomNavigationMain({super.key});

  @override
  State<BottomNavigationMain> createState() => _BottomNavigationMainState();
}

class _BottomNavigationMainState extends State<BottomNavigationMain> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      resizeToAvoidBottomInset: false,
      appBarBuilder: (context, tabsRouter) {
        return AppBarApp();
      },
      routes: [
        HomeMain(),
        SearchMain(),
        OrdersMain(),
        ProfileMain(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBarCustom(
          margin: EdgeInsets.symmetric(horizontal: 20),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              icon: Icon(FeatherIcons.home),
              title: Text('Início'),
            ),
            SalomonBottomBarItem(
              icon: Icon(FeatherIcons.search),
              title: Text('Busca'),
            ),
            SalomonBottomBarItem(
              icon: Icon(FeatherIcons.shoppingBag),
              title: Text('Pedidos'),
            ),
            SalomonBottomBarItem(
              icon: Icon(FeatherIcons.user),
              title: Text('Perfil'),
            ),
          ],
        );
      },
    );
  }
}

class SalomonBottomBarCustom extends SalomonBottomBar {
  SalomonBottomBarCustom({required super.items, super.onTap, super.margin, super.currentIndex});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: backgroundColor ?? Colors.transparent,
      child: SafeArea(
        minimum: margin,
        child: Container(
          height: 70,
          child: Row(
            /// Using a different alignment when there are 2 items or less
            /// so it behaves the same as BottomNavigationBar.s
            mainAxisAlignment: items.length <= 2 ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.spaceBetween,
            children: [
              for (final item in items)
                TweenAnimationBuilder<double>(
                  tween: Tween(
                    end: items.indexOf(item) == currentIndex ? 1.0 : 0.0,
                  ),
                  curve: curve,
                  duration: duration,
                  builder: (context, t, _) {
                    final _selectedColor = item.selectedColor ?? selectedItemColor ?? theme.primaryColor;

                    final _unselectedColor = item.unselectedColor ?? unselectedItemColor ?? theme.iconTheme.color;

                    return InkWell(
                      onTap: () => onTap?.call(items.indexOf(item)),
                      customBorder: itemShape,
                      focusColor: _selectedColor.withOpacity(0.1),
                      highlightColor: _selectedColor.withOpacity(0.1),
                      splashColor: _selectedColor.withOpacity(0.1),
                      hoverColor: _selectedColor.withOpacity(0.1),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            IconTheme(
                              data: IconThemeData(
                                color: Color.lerp(_unselectedColor, _selectedColor, t),
                                size: 24,
                              ),
                              child: items.indexOf(item) == currentIndex ? item.activeIcon ?? item.icon : item.icon,
                            ),
                            SizedBox(height: 5),
                            SizedBox(
                              /// TODO: Constrain item height without a fixed value
                              ///
                              /// The Align property appears to make these full height, would be
                              /// best to find a way to make it respond only to padding.
                              height: 20,
                              child: DefaultTextStyle(
                                style: TextStyle(
                                  color: Color.lerp(_unselectedColor, _selectedColor, t),
                                  fontWeight: FontWeight.w600,
                                ),
                                child: item.title,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
