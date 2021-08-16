import 'package:yellow_movies/models/Movie.dart';
import 'package:yellow_movies/models/MovieInfo.dart';

class AppState {
  List<MovieInfo> movies;
  AppState({this.movies = const []});
}
