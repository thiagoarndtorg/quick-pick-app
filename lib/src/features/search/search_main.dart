import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/features/search/presentation/view/search_view.dart';

@RoutePage()
class SearchMain extends StatelessWidget {
  const SearchMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchView();
  }
}
