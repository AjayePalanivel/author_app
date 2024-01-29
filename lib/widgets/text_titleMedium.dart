import 'package:authors_app/utils/color_palette.dart';
import 'package:flutter/material.dart';

Widget textTitleMedium({
  required BuildContext context,
  required String text,
  FontWeight fontWeight = FontWeight.normal,
  int maxLine = 1,
  TextOverflow textOverflow = TextOverflow.ellipsis,
  Color color = TextLight.primary,
}) =>
    Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: fontWeight,
            color: color,
          ),
    );
