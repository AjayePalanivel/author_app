import 'package:flutter/material.dart';

Widget circleAvatar({
  required String image,
  required double radius,
}) =>
    CircleAvatar(
      backgroundImage: NetworkImage("https://message-list.appspot.com$image"),
      radius: radius,
    );
