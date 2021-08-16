import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_movies/components/MovieList.dart';
import 'package:yellow_movies/models/MovieInfo.dart';
import 'package:yellow_movies/redux/app_state.dart';
import 'package:yellow_movies/screens/MovieDetail.dart';
import 'package:yellow_movies/services/MovieService.dart';
import 'package:yellow_movies/models/Movie.dart';
import 'package:flutter/services.dart';

class MoviesAppHome extends StatefulWidget {
  @override
  MoviesAppHomeState createState() => MoviesAppHomeState();
}

class MoviesAppHomeState extends State<MoviesAppHome> {
  final searchTextController = new TextEditingController();
  String searchText = "";

  @override
  void dispose() {
    searchTextController.dispose();
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
          title: Center(child: Text('Search Movies')),
        ),
        body: StoreConnector<AppState, List<MovieInfo>>(
          converter: (store) => store.state.movies,
          builder: (context, List<MovieInfo> stateMyMovies) => Column(
            children: <Widget>[
              Container(
                child: Row(children: <Widget>[
                  Flexible(
                    child: TextField(
                      controller: searchTextController,
                      decoration:
                          InputDecoration(hintText: 'Enter a search term'),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    tooltip: 'Search Movies',
                    onPressed: () {
                      setState(() {
                        searchText = searchTextController.text;
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                      });
                    },
                  ),
                ]),
                padding: EdgeInsets.all(10),
              ),
              if (searchText.length > 0)
                FutureBuilder<List<Movie>>(
                    future: searchMovies(searchText),
                    builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data == null) {
                          return CircularProgressIndicator();
                        }
                        if (snapshot.hasData == true) {
                          return Expanded(
                              child: MovieList(
                                  movies: snapshot.data!,
                                  itemClick: this.itemClick));
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
