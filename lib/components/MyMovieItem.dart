import 'package:flutter/material.dart';
import 'package:yellow_movies/models/MovieInfo.dart' as models;

class MyMovieItem extends StatelessWidget {
  final models.MovieInfo movie;

  MyMovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(children: <Widget>[
            if (this.movie.poster != "N/A")
              Image.network(this.movie.poster, height: 100, width: 100)
          ]),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.movie.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(this.movie.year),
                ]),
          )
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 8, left: 10, right: 10),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white),
    );
  }
}
