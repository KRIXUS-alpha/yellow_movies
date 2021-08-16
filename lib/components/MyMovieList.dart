import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_movies/components/MovieItem.dart';
import 'package:yellow_movies/models/Movie.dart';
import 'package:yellow_movies/models/MovieInfo.dart';
import 'package:yellow_movies/redux/app_state.dart';
import 'MyMovieItem.dart';

class MyMovieList extends StatelessWidget {
  // final List<Movie> movies;
  final Function itemClick;

  MyMovieList({required this.itemClick});

  @override
  Widget build(context) {
    return new Container(
        decoration: BoxDecoration(color: Colors.grey),
        child: StoreConnector<AppState, List<MovieInfo>>(
          converter: (store) => store.state.movies,
          builder: (context, List<MovieInfo> stateMyMovies) => ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: stateMyMovies.length,
              itemBuilder: (BuildContext context, int index) {
                return new GestureDetector(
                    child: MyMovieItem(movie: stateMyMovies[index]),
                    onTap: () => this.itemClick(stateMyMovies[index]));
              }),
        ));
  }
}
