import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  var _baseUrl = "api.themoviedb.org";
  var _apiKey = "6d6d52189580fcb80212d917146ea0fa";
  var _language = "es-ES";
  var _page = "1";

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    this._getOnDisplayMovies();
    this._getPopularMovies();
  }

  _getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
      "api_key": this._apiKey,
      "language": this._language,
      "page": this._page
    });

    final response = await http.get(url);
    NowPlayingResponse nowPlayingResponse =
        NowPlayingResponse.fromJson(response.body);
    this.onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  _getPopularMovies() async {
    var url = Uri.https(this._baseUrl, 'api.themoviedb.org/3/movie/popular', {
      "api_key": this._apiKey,
      "language": this._language,
      "page": this._page
    });

    final response = await http.get(url);
    PopularMoviesResponse popularMoviesResponse =
        PopularMoviesResponse.fromJson(response.body);
    this.popularMovies = [...popularMovies, ...popularMoviesResponse.results];
    notifyListeners();
  }
}
