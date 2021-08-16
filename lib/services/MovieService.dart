import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yellow_movies/models/Movie.dart';
import 'package:yellow_movies/models/MovieInfo.dart';

const API_KEY = "7391f651";
const API_URL = "http://www.omdbapi.com/?apikey=";

Future<List<Movie>> searchMovies(keyword) async {
  final response = await http.get(Uri.parse('$API_URL$API_KEY&s=$keyword'));

  if (response.statusCode == 200) {
    Map data = json.decode(response.body);

    if (data['Response'] == "True") {
      var list = (data['Search'] as List)
          .map((item) => new Movie.fromJson(item))
          .toList();
      return list;
    } else {
      throw Exception(data['Error']);
    }
  } else {
    throw Exception('Something went wrong !');
  }
}

Future<MovieInfo> getMovie(movieId) async {
  final response = await http.get(Uri.parse('$API_URL$API_KEY&i=$movieId'));

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);

    if (data['Response'] == "True") {
      return MovieInfo.fromJSON(data);
    } else {
      throw Exception(data['Error']);
    }
  } else {
    throw Exception('Something went wrong !');
  }
}

// List<Movie> storeWatched(movieId) {

// }