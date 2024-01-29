import 'package:flutter/material.dart';

Widget textHeadlineSmall(
        {required BuildContext context,
        required String text,
        FontWeight fontWeight = FontWeight.normal}) =>
    Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headlineSmall!
          .copyWith(fontWeight: fontWeight),
    );
