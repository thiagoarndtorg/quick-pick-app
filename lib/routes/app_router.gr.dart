// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:quick_pick_app/src/features/login/presentation/login_main.dart'
    as _i1;
import 'package:quick_pick_app/src/features/register/presentation/register_main.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    LoginMain.name: (routeData) {
      final args =
          routeData.argsAs<LoginMainArgs>(orElse: () => const LoginMainArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.LoginMain(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    RegisterMain.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.RegisterMain(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginMain]
class LoginMain extends _i3.PageRouteInfo<LoginMainArgs> {
  LoginMain({
    _i4.Key? key,
    dynamic Function(bool)? onResult,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          LoginMain.name,
          args: LoginMainArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginMain';

  static const _i3.PageInfo<LoginMainArgs> page =
      _i3.PageInfo<LoginMainArgs>(name);
}

class LoginMainArgs {
  const LoginMainArgs({
    this.key,
    this.onResult,
  });

  final _i4.Key? key;

  final dynamic Function(bool)? onResult;

  @override
  String toString() {
    return 'LoginMainArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i2.RegisterMain]
class RegisterMain extends _i3.PageRouteInfo<void> {
  const RegisterMain({List<_i3.PageRouteInfo>? children})
      : super(
          RegisterMain.name,
          initialChildren: children,
        );

  static const String name = 'RegisterMain';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
