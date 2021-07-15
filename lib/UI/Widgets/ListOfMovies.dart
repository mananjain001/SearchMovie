import 'package:flutter/material.dart';
import 'package:movie_search/Models/MoviesModel.dart';
import 'package:provider/provider.dart';
import 'MovieTile.dart';

class ListOfMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesModel>(builder: (context, movies, child) {
      return Container(
        child: movies.list.length == 0
            ? Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 4),
                  child: Text(
                    "Enter the name of movie",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            : Flexible(
                child: ListView.builder(
                  itemCount: movies.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MoviesTile(
                      item: movies.list[index],
                    );
                  },
                ),
              ),
      );
    });
  }
}
