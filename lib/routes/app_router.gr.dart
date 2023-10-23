// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:quick_pick_app/src/features/home/home_main.dart' as _i2;
import 'package:quick_pick_app/src/features/login/login_main.dart' as _i3;
import 'package:quick_pick_app/src/features/orders/orders_main.dart' as _i4;
import 'package:quick_pick_app/src/features/profile/profile_main.dart' as _i5;
import 'package:quick_pick_app/src/features/register/register_main.dart' as _i6;
import 'package:quick_pick_app/src/features/restaurant/restaurant_main.dart'
    as _i7;
import 'package:quick_pick_app/src/features/search/search_main.dart' as _i8;
import 'package:quick_pick_app/src/utils/common/bottomNavigation/bottom_navigation_main.dart'
    as _i1;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    BottomNavigationMain.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BottomNavigationMain(),
      );
    },
    HomeMain.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeMain(),
      );
    },
    LoginMain.name: (routeData) {
      final args =
          routeData.argsAs<LoginMainArgs>(orElse: () => const LoginMainArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LoginMain(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    OrdersMain.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.OrdersMain(),
      );
    },
    ProfileMain.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProfileMain(),
      );
    },
    RegisterMain.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RegisterMain(),
      );
    },
    RestaurantMain.name: (routeData) {
      final args = routeData.argsAs<RestaurantMainArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.RestaurantMain(
          key: args.key,
          restaurantId: args.restaurantId,
        ),
      );
    },
    SearchMain.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SearchMain(),
      );
    },
  };
}

/// generated route for
/// [_i1.BottomNavigationMain]
class BottomNavigationMain extends _i9.PageRouteInfo<void> {
  const BottomNavigationMain({List<_i9.PageRouteInfo>? children})
      : super(
          BottomNavigationMain.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigationMain';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeMain]
class HomeMain extends _i9.PageRouteInfo<void> {
  const HomeMain({List<_i9.PageRouteInfo>? children})
      : super(
          HomeMain.name,
          initialChildren: children,
        );

  static const String name = 'HomeMain';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginMain]
class LoginMain extends _i9.PageRouteInfo<LoginMainArgs> {
  LoginMain({
    _i10.Key? key,
    dynamic Function(bool)? onResult,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          LoginMain.name,
          args: LoginMainArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginMain';

  static const _i9.PageInfo<LoginMainArgs> page =
      _i9.PageInfo<LoginMainArgs>(name);
}

class LoginMainArgs {
  const LoginMainArgs({
    this.key,
    this.onResult,
  });

  final _i10.Key? key;

  final dynamic Function(bool)? onResult;

  @override
  String toString() {
    return 'LoginMainArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i4.OrdersMain]
class OrdersMain extends _i9.PageRouteInfo<void> {
  const OrdersMain({List<_i9.PageRouteInfo>? children})
      : super(
          OrdersMain.name,
          initialChildren: children,
        );

  static const String name = 'OrdersMain';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProfileMain]
class ProfileMain extends _i9.PageRouteInfo<void> {
  const ProfileMain({List<_i9.PageRouteInfo>? children})
      : super(
          ProfileMain.name,
          initialChildren: children,
        );

  static const String name = 'ProfileMain';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RegisterMain]
class RegisterMain extends _i9.PageRouteInfo<void> {
  const RegisterMain({List<_i9.PageRouteInfo>? children})
      : super(
          RegisterMain.name,
          initialChildren: children,
        );

  static const String name = 'RegisterMain';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.RestaurantMain]
class RestaurantMain extends _i9.PageRouteInfo<RestaurantMainArgs> {
  RestaurantMain({
    _i10.Key? key,
    required int restaurantId,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          RestaurantMain.name,
          args: RestaurantMainArgs(
            key: key,
            restaurantId: restaurantId,
          ),
          initialChildren: children,
        );

  static const String name = 'RestaurantMain';

  static const _i9.PageInfo<RestaurantMainArgs> page =
      _i9.PageInfo<RestaurantMainArgs>(name);
}

class RestaurantMainArgs {
  const RestaurantMainArgs({
    this.key,
    required this.restaurantId,
  });

  final _i10.Key? key;

  final int restaurantId;

  @override
  String toString() {
    return 'RestaurantMainArgs{key: $key, restaurantId: $restaurantId}';
  }
}

/// generated route for
/// [_i8.SearchMain]
class SearchMain extends _i9.PageRouteInfo<void> {
  const SearchMain({List<_i9.PageRouteInfo>? children})
      : super(
          SearchMain.name,
          initialChildren: children,
        );

  static const String name = 'SearchMain';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
