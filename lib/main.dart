import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_movies/redux/app_state.dart';
import 'package:yellow_movies/redux/reducer.dart';
import 'package:yellow_movies/screens/MoviesAppHome.dart';
import 'package:redux/redux.dart';

void main() => runApp(MoviesApp());

class MoviesApp extends StatelessWidget {
  final Store<AppState> _store = Store<AppState>(
    updateMoviesReducer,
    initialState: AppState(movies: []),
  );
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: _store,
        child: MaterialApp(
          title: 'Movies Sample',
          home: MoviesAppHome(),
        ));
  }
}
