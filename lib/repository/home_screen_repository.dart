import 'dart:convert';

import 'package:authors_app/models/author_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenRepository extends ChangeNotifier {
  List<AuthorDetails> _authorsList = [];
  List<AuthorDetails> _autoCompleteList = [];

  getAuthorData() async {
    final http.Response response =
        await http.get(Uri.parse("http://message-list.appspot.com/messages"));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['messages'];
      _authorsList = data.map((e) => AuthorDetails.fromMap(e)).toList();
      notifyListeners();
    }
  }

  get authorsList => _authorsList;

  void toggleFavorite(int id) {
    AuthorDetails? foundItem = _authorsList.firstWhere((item) => item.id == id);
    int index = _authorsList.indexWhere((element) => element == foundItem);
    _authorsList[index].favorite = !_authorsList[index].favorite;
    notifyListeners();
  }

  void autoSearchComplete(String text) {
    _autoCompleteList = _authorsList
        .where((element) => element.author.name.toLowerCase().startsWith(text))
        .toList();
    notifyListeners();
  }

  void deleteAuthor(int id) {
    AuthorDetails? foundItem = _authorsList.firstWhere((item) => item.id == id);
    _authorsList.remove(foundItem);
    notifyListeners();
  }

  void deleteSearchAuthor(int id) {
    AuthorDetails? foundItem =
        _autoCompleteList.firstWhere((item) => item.id == id);
    _autoCompleteList.remove(foundItem);
    notifyListeners();
  }

  get autoCompleteList => _autoCompleteList;
}
