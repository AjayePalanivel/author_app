import 'package:authors_app/widgets/circule_avatar.dart';
import 'package:authors_app/widgets/text_bodyLarge.dart';
import 'package:authors_app/widgets/text_titleMedium.dart';
import 'package:flutter/material.dart';

Widget authorDetailDisplay({
  required BuildContext context,
  required String image,
  required String name,
  required double radius,
  required double textBox,
  required double gap,
  bool alertDialog = false,
}) {
  return Row(
    children: [
      circleAvatar(image: image, radius: radius),
      SizedBox(width: gap),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: textBox,
            child: textTitleMedium(
                text: name, context: context, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0),
          textBodyLarge(text: '7 years ago', context: context),
        ],
      ),
    ],
  );
}
