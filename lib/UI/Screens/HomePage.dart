import 'package:flutter/material.dart';
import 'package:movie_search/UI/Widgets/SearchBar.dart';
import 'package:movie_search/UI/Widgets/ListOfMovies.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0),
                child: Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0),
                child: SearchBar(),
              ),
              ListOfMovies()
            ],
          ),
        ),
      ),
    );
  }
}
