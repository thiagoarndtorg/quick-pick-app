import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';

class AppBarApp extends StatefulWidget
    implements PreferredSizeWidget {
  final void Function()? onBackPressed;
  AppBarApp({Key? key, this.onBackPressed})
      : preferredSize = Size.fromHeight(80),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _AppBarAppState createState() => _AppBarAppState();
}

class _AppBarAppState extends State<AppBarApp> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      centerTitle: true,
      title: Image.asset(
        'assets/images/logo.png',
        width: 70,
      ),
      leading: widget.onBackPressed != null
          ? IconButton(
              icon: Icon(
                FeatherIcons.chevronLeft,
                color: appColorPrimary,
              ),
              onPressed: widget.onBackPressed)
          : SizedBox.shrink(),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
