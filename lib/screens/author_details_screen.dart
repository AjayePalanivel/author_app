import 'package:authors_app/models/author_model.dart';
import 'package:authors_app/repository/home_screen_repository.dart';
import 'package:authors_app/utils/color_palette.dart';
import 'package:authors_app/widgets/circule_avatar.dart';
import 'package:authors_app/widgets/text_headlineSmall.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthorDetailsScreen extends StatefulWidget {
  final int id;
  const AuthorDetailsScreen({super.key, required this.id});

  @override
  State<AuthorDetailsScreen> createState() => _AuthorDetailsScreenState();
}

class _AuthorDetailsScreenState extends State<AuthorDetailsScreen> {
  late AuthorDetails author;
  @override
  void initState() {
    super.initState();
    author = Provider.of<HomeScreenRepository>(context, listen: false)
        .authorsList
        .firstWhere((item) => item.id == widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Consumer<HomeScreenRepository>(
          builder: (context, homeScreenRepository, child) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: IconLight.secondaryIcon,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: textHeadlineSmall(
                            context: context,
                            text: 'Details',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          homeScreenRepository.toggleFavorite(author.id);
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 30,
                        color: author.favorite
                            ? IconLight.favoriteIconLight
                            : IconLight.primaryIcon,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                circleAvatar(
                  image: author.author.photoUrl,
                  radius: MediaQuery.of(context).size.width * 0.25,
                ),
                const SizedBox(height: 28),
                textHeadlineSmall(
                  context: context,
                  text: author.author.name,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 40),
                Text(
                  author.content,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
