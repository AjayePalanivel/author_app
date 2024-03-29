import 'package:authors_app/models/author_model.dart';
import 'package:authors_app/repository/home_screen_repository.dart';
import 'package:authors_app/screens/author_details_screen.dart';
import 'package:authors_app/widgets/alert_dialog.dart';
import 'package:authors_app/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthorDisplayList extends StatefulWidget {
  final ScrollController scrollController;
  const AuthorDisplayList({super.key, required this.scrollController});

  @override
  State<AuthorDisplayList> createState() => _AuthorDisplayListState();
}

class _AuthorDisplayListState extends State<AuthorDisplayList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenRepository>(
      builder: (context, homeScreenRepository, child) {
        return Expanded(
          child: ListView.builder(
            controller: widget.scrollController,
            itemCount: homeScreenRepository.authorsList.length,
            itemBuilder: (context, index) {
              AuthorDetails authorDetail =
                  homeScreenRepository.authorsList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AuthorDetailsScreen(id: authorDetail.id),
                    ),
                  );
                },
                child: tile(
                  authorDetail: authorDetail,
                  context: context,
                  favoriteButtonCallBack: () {
                    homeScreenRepository.toggleFavorite(authorDetail.id);
                  },
                  deleteButtonCallBack: () {
                    showDialog(
                      context: context,
                      builder: (context) => alertDialog(
                        context: context,
                        authorDetail: authorDetail,
                        deleteCallBack: () {
                          setState(() {
                            homeScreenRepository.deleteAuthor(authorDetail.id);
                            Navigator.of(context).pop();
                          });
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
