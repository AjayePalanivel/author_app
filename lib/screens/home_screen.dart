import 'package:authors_app/repository/home_screen_repository.dart';
import 'package:authors_app/utils/color_palette.dart';
import 'package:authors_app/widgets/author_display_list.dart';
import 'package:authors_app/widgets/search_input_field.dart';
import 'package:authors_app/widgets/search_result_list.dart';
import 'package:authors_app/widgets/text_titleMedium.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController textEditingController;
  bool showSearchedResult = false;
  late ScrollController scrollController;
  int maxListLength = 100;
  int itemsPerPage = 10;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    try {
      Provider.of<HomeScreenRepository>(context, listen: false).getAuthorData();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> _scrollListener() async {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        itemsPerPage < maxListLength) {
      try {
        setState(() {
          isLoading = true;
        });
        await Future.delayed(const Duration(seconds: 2));
        Provider.of<HomeScreenRepository>(context, listen: false)
            .getAuthorData();
        itemsPerPage += 10;
        setState(() {
          isLoading = false;
        });
      } catch (error) {
        setState(() {
          isLoading = false;
        });
        debugPrint(error.toString());
      }
    }
  }

  @override
  void dispose() {
    textEditingController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 18, left: 18, right: 18, bottom: 10),
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
                      visible: !showSearchedResult,
                      child: const SizedBox(height: 30)),
                  Visibility(
                    visible: showSearchedResult,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
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
                  ),
                  Visibility(
                    visible: showSearchedResult,
                    child: const SearchResultList(),
                  ),
                  Visibility(
                    visible: !showSearchedResult,
                    child:
                        AuthorDisplayList(scrollController: scrollController),
                  ),
                  Visibility(
                    visible: isLoading,
                    child: const SizedBox(
                      height: 10,
                      child: SpinKitThreeBounce(color: LoadingLight.primary),
                    ),
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
