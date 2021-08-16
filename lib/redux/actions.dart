import 'package:yellow_movies/models/Movie.dart';
import 'package:yellow_movies/models/MovieInfo.dart';

class UpdateMoviesAction {
  final MovieInfo updatedMovie;
  UpdateMoviesAction(this.updatedMovie);
}
