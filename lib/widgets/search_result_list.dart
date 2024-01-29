import 'package:authors_app/models/author_model.dart';
import 'package:authors_app/repository/home_screen_repository.dart';
import 'package:authors_app/screens/author_details_screen.dart';
import 'package:authors_app/widgets/alert_dialog.dart';
import 'package:authors_app/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchResultList extends StatefulWidget {
  const SearchResultList({super.key});

  @override
  State<SearchResultList> createState() => _SearchResultListState();
}

class _SearchResultListState extends State<SearchResultList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenRepository>(
      builder: (context, homeScreenRepository, child) {
        return Expanded(
          child: ListView.builder(
            itemCount: homeScreenRepository.autoCompleteList.length,
            itemBuilder: (context, index) {
              AuthorDetails authorDetail =
                  homeScreenRepository.autoCompleteList[index];
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
                  context: context,
                  authorDetail: authorDetail,
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
                            homeScreenRepository
                                .deleteSearchAuthor(authorDetail.id);
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
