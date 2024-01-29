import 'package:authors_app/widgets/text_titleMedium.dart';
import 'package:flutter/material.dart';

Widget textButton({
  required String text,
  required BuildContext context,
  required VoidCallback onTap,
}) =>
    TextButton(
      onPressed: onTap,
      child: textTitleMedium(
          text: 'Cancel', context: context, fontWeight: FontWeight.bold),
    );
