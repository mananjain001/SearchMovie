import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_search/Models/ItemsModel.dart';

class MoviesTile extends StatelessWidget {
  ItemsModel item;
  MoviesTile({this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            height: 200,
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 15.0,
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Row(
            children: [
              SizedBox(
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage(
                    fit: BoxFit.scaleDown,
                    height: 250,
                    image: NetworkImage(item.poster_url),
                    placeholder: AssetImage('assets/images/placeholder.jpg'),
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      item.genre,
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: double.parse(item.rating.toString()) > 7
                            ? Colors.green
                            : double.parse(item.rating.toString()) > 4
                                ? Colors.blue
                                : Colors.red,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 18.0),
                        child: Text(
                          item.rating + " IMDB",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
