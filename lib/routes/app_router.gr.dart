// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:quick_pick_app/src/features/food/data/model/food_model.dart';
import 'package:quick_pick_app/src/features/food/food_main.dart' as _i2;
import 'package:quick_pick_app/src/features/home/home_main.dart' as _i3;
import 'package:quick_pick_app/src/features/login/login_main.dart' as _i4;
import 'package:quick_pick_app/src/features/orders/orders_main.dart' as _i5;
import 'package:quick_pick_app/src/features/profile/profile_main.dart' as _i6;
import 'package:quick_pick_app/src/features/register/register_main.dart' as _i7;
import 'package:quick_pick_app/src/features/restaurant/restaurant_main.dart' as _i8;
import 'package:quick_pick_app/src/features/search/search_main.dart' as _i9;
import 'package:quick_pick_app/src/utils/common/bottomNavigation/bottom_navigation_main.dart' as _i1;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    BottomNavigationMain.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BottomNavigationMain(),
      );
    },
    FoodMain.name: (routeData) {
      final args = routeData.argsAs<FoodMainArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.FoodMain(
          key: args.key,
          foodModel: args.foodModel,
        ),
      );
    },
    HomeMain.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeMain(),
      );
    },
    LoginMain.name: (routeData) {
      final args = routeData.argsAs<LoginMainArgs>(orElse: () => const LoginMainArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.LoginMain(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    OrdersMain.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.OrdersMain(),
      );
    },
    ProfileMain.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProfileMain(),
      );
    },
    RegisterMain.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.RegisterMain(),
      );
    },
    RestaurantMain.name: (routeData) {
      final args = routeData.argsAs<RestaurantMainArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.RestaurantMain(
          key: args.key,
          restaurantId: args.restaurantId,
        ),
      );
    },
    SearchMain.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SearchMain(),
      );
    },
  };
}

/// generated route for
/// [_i1.BottomNavigationMain]
class BottomNavigationMain extends _i10.PageRouteInfo<void> {
  const BottomNavigationMain({List<_i10.PageRouteInfo>? children})
      : super(
          BottomNavigationMain.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigationMain';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FoodMain]
class FoodMain extends _i10.PageRouteInfo<FoodMainArgs> {
  FoodMain({
    _i11.Key? key,
    required FoodModel foodModel,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          FoodMain.name,
          args: FoodMainArgs(
            key: key,
            foodModel: foodModel,
          ),
          initialChildren: children,
        );

  static const String name = 'FoodMain';

  static const _i10.PageInfo<FoodMainArgs> page = _i10.PageInfo<FoodMainArgs>(name);
}

class FoodMainArgs {
  const FoodMainArgs({
    this.key,
    required this.foodModel,
  });

  final _i11.Key? key;

  final FoodModel foodModel;

  @override
  String toString() {
    return 'FoodMainArgs{key: $key, foodModel: $foodModel}';
  }
}

/// generated route for
/// [_i3.HomeMain]
class HomeMain extends _i10.PageRouteInfo<void> {
  const HomeMain({List<_i10.PageRouteInfo>? children})
      : super(
          HomeMain.name,
          initialChildren: children,
        );

  static const String name = 'HomeMain';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginMain]
class LoginMain extends _i10.PageRouteInfo<LoginMainArgs> {
  LoginMain({
    _i11.Key? key,
    dynamic Function(bool)? onResult,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          LoginMain.name,
          args: LoginMainArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginMain';

  static const _i10.PageInfo<LoginMainArgs> page = _i10.PageInfo<LoginMainArgs>(name);
}

class LoginMainArgs {
  const LoginMainArgs({
    this.key,
    this.onResult,
  });

  final _i11.Key? key;

  final dynamic Function(bool)? onResult;

  @override
  String toString() {
    return 'LoginMainArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i5.OrdersMain]
class OrdersMain extends _i10.PageRouteInfo<void> {
  const OrdersMain({List<_i10.PageRouteInfo>? children})
      : super(
          OrdersMain.name,
          initialChildren: children,
        );

  static const String name = 'OrdersMain';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ProfileMain]
class ProfileMain extends _i10.PageRouteInfo<void> {
  const ProfileMain({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileMain.name,
          initialChildren: children,
        );

  static const String name = 'ProfileMain';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.RegisterMain]
class RegisterMain extends _i10.PageRouteInfo<void> {
  const RegisterMain({List<_i10.PageRouteInfo>? children})
      : super(
          RegisterMain.name,
          initialChildren: children,
        );

  static const String name = 'RegisterMain';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.RestaurantMain]
class RestaurantMain extends _i10.PageRouteInfo<RestaurantMainArgs> {
  RestaurantMain({
    _i11.Key? key,
    required int restaurantId,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          RestaurantMain.name,
          args: RestaurantMainArgs(
            key: key,
            restaurantId: restaurantId,
          ),
          initialChildren: children,
        );

  static const String name = 'RestaurantMain';

  static const _i10.PageInfo<RestaurantMainArgs> page = _i10.PageInfo<RestaurantMainArgs>(name);
}

class RestaurantMainArgs {
  const RestaurantMainArgs({
    this.key,
    required this.restaurantId,
  });

  final _i11.Key? key;

  final int restaurantId;

  @override
  String toString() {
    return 'RestaurantMainArgs{key: $key, restaurantId: $restaurantId}';
  }
}

/// generated route for
/// [_i9.SearchMain]
class SearchMain extends _i10.PageRouteInfo<void> {
  const SearchMain({List<_i10.PageRouteInfo>? children})
      : super(
          SearchMain.name,
          initialChildren: children,
        );

  static const String name = 'SearchMain';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
