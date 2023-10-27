import 'package:brasil_fields/brasil_fields.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';

class TextFieldApp extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool isPassword;
  final TextInputType inputType;
  final TextEditingController controller;
  final List<TextInputFormatter> formatters;
  const TextFieldApp({
    super.key,
    required this.title,
    required this.icon,
    required this.inputType,
    required this.controller,
    this.isPassword = false,
    this.formatters = const [],
  });

  @override
  State<TextFieldApp> createState() => _TextFieldAppState();
}

class _TextFieldAppState extends State<TextFieldApp> {
  late bool _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return value!.isEmpty ? 'Campo obrigatório' : null;
      },
      inputFormatters: widget.formatters,
      controller: widget.controller,
      obscureText: widget.isPassword,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.amberAccent),
        ),
        hintText: widget.title,
        hintStyle: TextStyle(color: appColorDescription),
        filled: true,
        fillColor: appColorWhite,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _passwordVisible
                      ? FeatherIcons.eye
                      : FeatherIcons.eyeOff,
                  size: 22,
                  color: appColorDescription,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : null,
        prefixIcon:
            Icon(widget.icon, size: 22, color: appColorDescription),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: appColorBorder),
          borderRadius: BorderRadius.circular(9.0),
        ),
      ),
    );
  }
}
