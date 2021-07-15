import 'package:flutter/material.dart';
import 'package:movie_search/Models/MoviesModel.dart';
import 'package:movie_search/UI/Screens/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MoviesModel(),
      child: MovieSearchApp(),
    ),
  );
}

class MovieSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
