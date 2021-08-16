import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_movies/components/MovieList.dart';
import 'package:yellow_movies/components/MyMovieList.dart';
import 'package:yellow_movies/models/MovieInfo.dart';
import 'package:yellow_movies/redux/app_state.dart';
import 'package:yellow_movies/screens/MovieDetail.dart';
import 'package:yellow_movies/models/Movie.dart';
import 'package:yellow_movies/screens/MoviesAppHome.dart';

class MyMovies extends StatefulWidget {
  @override
  MyMoviesState createState() => MyMoviesState();
}

// class MyMov {
//   List<String> movies;
//   MyMov({this.})
// }

class MyMoviesState extends State<MyMovies> {
  @override
  void dispose() {
    super.dispose();
  }

  void itemClick(Movie item) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MovieDetail(
                movieName: item.title,
                imdbId: item.imdbID,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Your watched movies')),
        ),
        body: StoreConnector<AppState, List<MovieInfo>>(
          converter: (store) => store.state.movies,
          builder: (context, List<MovieInfo> stateMyMovies) => Column(
            children: <Widget>[
              FutureBuilder<List<Movie>>(
                  builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data == null) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasData == true) {
                    return Expanded(
                        child: MyMovieList(itemClick: this.itemClick));
                  }
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              }),
            ],
          ),
        ));
  }
}
