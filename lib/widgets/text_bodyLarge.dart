import 'package:authors_app/utils/color_palette.dart';
import 'package:flutter/material.dart';

Widget textBodyLarge({
  required String text,
  required BuildContext context,
  Color color = TextLight.primary,
  FontWeight fontWeight = FontWeight.normal,
  int maxLine = 1,
  TextOverflow textOverflow = TextOverflow.ellipsis,
}) =>
    Text(
      text,
      maxLines: maxLine,
      overflow: textOverflow,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontWeight: fontWeight, color: color),
    );
