import 'package:authors_app/repository/home_screen_repository.dart';
import 'package:authors_app/utils/color_palette.dart';
import 'package:authors_app/widgets/author_display_list.dart';
import 'package:authors_app/widgets/search_input_field.dart';
import 'package:authors_app/widgets/search_result_list.dart';
import 'package:authors_app/widgets/text_titleMedium.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController textEditingController;
  bool showSearchedResult = false;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    try {
      Provider.of<HomeScreenRepository>(context, listen: false).getAuthorData();
    } catch (e) {}
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Consumer<HomeScreenRepository>(
            builder: (context, homeScreenRepository, child) {
              return Column(
                children: [
                  searchInputField(
                    textEditingController: textEditingController,
                    onChangeFunction: (String text) {
                      if (textEditingController.text.isNotEmpty) {
                        homeScreenRepository
                            .autoSearchComplete(textEditingController.text);
                        showSearchedResult = true;
                      } else {
                        showSearchedResult = false;
                      }
                      setState(() {});
                    },
                  ),
                  Visibility(
                      visible: showSearchedResult,
                      child: const SizedBox(height: 30)),
                  Visibility(
                    visible: showSearchedResult,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textTitleMedium(
                          context: context,
                          text: 'Search Result',
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                        const Spacer(),
                        textTitleMedium(
                          context: context,
                          text:
                              '${homeScreenRepository.autoCompleteList.length} ${homeScreenRepository.autoCompleteList.length > 1 ? 'founds' : 'found'}',
                          fontWeight: FontWeight.bold,
                          color: TextLight.secondary,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: showSearchedResult,
                    child: const SearchResultList(),
                  ),
                  Visibility(
                    visible: !showSearchedResult,
                    child: const AuthorDisplayList(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
