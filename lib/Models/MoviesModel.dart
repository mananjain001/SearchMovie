import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_search/Network/GetData.dart';
import 'ItemsModel.dart';

class MoviesModel extends ChangeNotifier {
  String movieSearch;
  final List<ItemsModel> list = [];

  void searchMovies() async {
    try {
      list.clear();
      list.addAll(await GetData.fetchData(movieSearch));
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
