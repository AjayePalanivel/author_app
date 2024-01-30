import 'package:authors_app/models/author_model.dart';
import 'package:authors_app/utils/color_palette.dart';
import 'package:authors_app/widgets/author_details_display.dart';
import 'package:authors_app/widgets/elevated_delete_button.dart';
import 'package:flutter/material.dart';

Widget tile({
  required BuildContext context,
  required AuthorDetails authorDetail,
  required VoidCallback favoriteButtonCallBack,
  required VoidCallback deleteButtonCallBack,
}) {
  double width = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(bottom: 30.0),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      decoration: BoxDecoration(
        border: Border.all(color: TileLight.primary, width: 2.0),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          authorDetailDisplay(
            context: context,
            image: authorDetail.author.photoUrl,
            name: authorDetail.author.name,
            radius: width * 0.07,
            textBox: width * 0.34,
            gap: width * 0.025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: favoriteButtonCallBack,
                icon: Icon(
                  Icons.favorite,
                  size: width * 0.07,
                  color: authorDetail.favorite
                      ? IconLight.favoriteIconLight
                      : IconLight.primaryIcon,
                ),
              ),
              elevatedDeleteButton(
                context: context,
                function: deleteButtonCallBack,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
