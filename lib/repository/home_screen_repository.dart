import 'dart:convert';

import 'package:authors_app/models/author_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenRepository extends ChangeNotifier {
  final List<AuthorDetails> _authorsList = [];
  List<AuthorDetails> _autoCompleteList = [];
  int _dataCount = 0;

  get authorsList => _authorsList;

  get autoCompleteList => _autoCompleteList;

  getAuthorData() async {
    final http.Response response =
        await http.get(Uri.parse("http://message-list.appspot.com/messages"));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['messages'];
      _authorsList.addAll(data.map((e) {
        AuthorDetails author = AuthorDetails.fromMap(e);
        author.id = ++_dataCount;
        return author;
      }).toList());
      notifyListeners();
    } else {
      throw Exception('Some thing went wrong in getting data');
    }
  }

  void toggleFavorite(int id) {
    AuthorDetails? foundItem = _authorsList.firstWhere((item) => item.id == id);
    foundItem.favorite = !foundItem.favorite;
    notifyListeners();
  }

  void autoSearchComplete(String text) {
    _autoCompleteList = _authorsList
        .where((element) => element.author.name.toLowerCase().startsWith(text))
        .toList();
    notifyListeners();
  }

  void deleteAuthor(int id, {bool isSearchedData = false}) {
    AuthorDetails? foundItem = _authorsList.firstWhere((item) => item.id == id);
    _authorsList.remove(foundItem);
    if (isSearchedData) {
      AuthorDetails? foundItem =
          _autoCompleteList.firstWhere((item) => item.id == id);
      _autoCompleteList.remove(foundItem);
    }
    notifyListeners();
  }
}
