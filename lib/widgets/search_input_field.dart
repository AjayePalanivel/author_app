import 'package:authors_app/utils/color_palette.dart';
import 'package:flutter/material.dart';

Widget searchInputField({
  required TextEditingController textEditingController,
  String hintTextString = 'Search...',
  void Function(String value)? onChangeFunction,
}) =>
    TextField(
      controller: textEditingController,
      onChanged: onChangeFunction,
      decoration: InputDecoration(
        hintText: hintTextString,
        hintStyle: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        suffixIcon: const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.search,
            color: InputLight.primaryIcon,
          ),
        ),
      ),
    );
