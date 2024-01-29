import 'package:authors_app/utils/color_palette.dart';
import 'package:flutter/material.dart';

Widget textTitleLarge({
  required BuildContext context,
  required String text,
  FontWeight fontWeight = FontWeight.normal,
  Color color = TextLight.primary,
}) =>
    Text(
      text,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: color,
            fontWeight: fontWeight,
          ),
    );
