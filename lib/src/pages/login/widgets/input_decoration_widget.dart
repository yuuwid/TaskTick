import 'package:flutter/material.dart';
import 'package:tasktick/src/app/theme/color_style.dart';

class InputDecorationWidget {
  static InputDecoration build({
    required String label,
    required IconData icon,
    suffixIcon = null,
  }) {
    return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      labelText: "$label",
      // hintText: "$text",
      hintTextDirection: TextDirection.ltr,
      labelStyle: TextStyle(color: Colors.grey),
      floatingLabelStyle: TextStyle(color: primaryColor),
      isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      icon: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Icon(
          icon,
          color: Colors.grey,
          size: 16,
        ),
      ),
      suffixIcon: Padding(
        padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10, end: 15),
        child: (suffixIcon != null) ? Icon(suffixIcon) : Icon(null),
      ),
      suffixIconConstraints: BoxConstraints(maxHeight: 50),
      suffixIconColor: Colors.grey,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          style: BorderStyle.none,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          style: BorderStyle.none,
        ),
      ),
    );
  }
}
