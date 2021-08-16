import 'package:flutter/material.dart';
import 'package:yellow_movies/components/MovieList.dart';
import 'package:yellow_movies/screens/MovieDetail.dart';
import 'package:yellow_movies/models/Movie.dart';

class MyMovies extends StatefulWidget {
  @override
  MyMoviesState createState() => MyMoviesState();
}

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
        body: Column(
          children: <Widget>[
            FutureBuilder<List<Movie>>(
                builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data == null) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasData == true) {
                  return Expanded(
                      child: MovieList(
                          movies: snapshot.data!, itemClick: this.itemClick));
                }
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }),
          ],
        ));
  }
}
