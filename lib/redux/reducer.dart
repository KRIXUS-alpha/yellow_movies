import 'app_state.dart';
import 'actions.dart';

AppState updateMoviesReducer(AppState state, dynamic action) {
  if (action is UpdateMoviesAction) {
    return AppState(
        movies: []
          ..addAll(state.movies)
          ..add(action.updatedMovie));
  }
  return state;
}
