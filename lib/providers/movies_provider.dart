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

  MoviesProvider() {
    print('Movies Provider Inicializado');
    this._getOnDisplayMovies();
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
}
