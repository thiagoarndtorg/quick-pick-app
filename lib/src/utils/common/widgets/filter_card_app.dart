import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';

class FilterCardApp extends StatelessWidget {
  final String title;
  final bool isSelected;
  const FilterCardApp({super.key, required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSelected ? appColorPrimary : Color.fromARGB(65, 234, 181, 47),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: isSelected ? appColorWhite : appColorPrimary),
          ),
        ),
      ),
    );
  }
}
