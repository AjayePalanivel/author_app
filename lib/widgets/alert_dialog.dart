import 'package:authors_app/models/author_model.dart';
import 'package:authors_app/utils/color_palette.dart';
import 'package:authors_app/widgets/author_details_display.dart';
import 'package:authors_app/widgets/elevated_delete_button.dart';
import 'package:authors_app/widgets/text_button.dart';
import 'package:authors_app/widgets/text_headlineSmall.dart';
import 'package:authors_app/widgets/text_titleLarge.dart';
import 'package:flutter/material.dart';

Widget alertDialog({
  required BuildContext context,
  required AuthorDetails authorDetail,
  required VoidCallback deleteCallBack,
}) {
  double width = MediaQuery.of(context).size.width;
  return AlertDialog(
    insetPadding: const EdgeInsets.symmetric(horizontal: 20),
    titlePadding: const EdgeInsets.only(left: 30, top: 30),
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 30.0, vertical: 14.0),
    actionsPadding: const EdgeInsets.only(bottom: 30, right: 30),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    title: textHeadlineSmall(
        context: context,
        text: 'Delete this author?',
        fontWeight: FontWeight.bold),
    content: SizedBox(
      width: width,
      height: 80,
      child: authorDetailDisplay(
        context: context,
        image: authorDetail.author.photoUrl,
        name: authorDetail.author.name,
        radius: width * 0.08,
        textBox: width * 0.4,
        gap: 18,
      ),
    ),
    actions: [
      textButton(
          text: 'Cancel',
          context: context,
          onTap: () {
            Navigator.of(context).pop();
          }),
      const SizedBox(width: 10),
      elevatedDeleteButton(
        context: context,
        function: deleteCallBack,
        child: textTitleLarge(
          context: context,
          text: 'Delete',
          fontWeight: FontWeight.bold,
          color: ElevatedButtonLight.primaryText,
        ),
      ),
    ],
  );
}
