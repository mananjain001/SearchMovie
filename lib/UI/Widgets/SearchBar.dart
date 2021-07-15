import 'package:flutter/material.dart';
import 'package:movie_search/Models/MoviesModel.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesModel>(
      builder: (context, movies, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            onChanged: (value) {
              movies.movieSearch = value;
            },
            onSubmitted: (value) => movies.searchMovies(),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.search, color: Colors.black),
                onPressed: () => movies.searchMovies(),
              ),
              labelText: 'Search for movies',
            ),
          ),
        );
      },
    );
  }
}
