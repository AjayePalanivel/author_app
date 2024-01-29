import 'package:authors_app/utils/color_palette.dart';
import 'package:authors_app/widgets/text_titleMedium.dart';
import 'package:flutter/material.dart';

Widget elevatedDeleteButton({
  required BuildContext context,
  required VoidCallback function,
  Widget? child,
}) =>
    ElevatedButton(
      onPressed: function,
      child: child ??
          textTitleMedium(
            context: context,
            text: 'Delete',
            maxLine: 1,
            textOverflow: TextOverflow.ellipsis,
            color: ElevatedButtonLight.primaryText,
            fontWeight: FontWeight.bold,
          ),
    );
