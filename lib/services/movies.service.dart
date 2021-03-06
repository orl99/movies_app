import 'package:movies_app/models/movies.mode.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MoviesService {
  String _apiKey  = '2fea9fd72eb9ca0954ff93cb50945048';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Movie>> getInCines() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key' : this._apiKey,
      'language': this._language
    });
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final movies = new Movies.fromJsonList(decodedData['results']);
    print(movies);
    return movies.items;
  }

  Future<List<Movie>> getPopular() async {
    final url = Uri.https(this._url, '3/movie/popular',  {
      'api_key'  : this._apiKey,
      'language' : this._language
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final poularMovies =  new Movies.fromJsonList(decodedData['results']);

    return poularMovies.items;
  }
}