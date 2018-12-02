import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cinema/constants.dart';

abstract class MovieNetwork {
  static Future<dynamic> listPopularMovie() async {
    String url = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=pt-BR';
    print('passando pelo método de listar');
    var res = await http.get(url, headers: { 'Accept': 'application/json' }).catchError((error) {
      print('error: ${error.toString()}');
    });
    print('body resBody');
    return json.decode(res.body);
  }

  static Future<Map> getMovieDetails(int movieId) async {
    String url = 'https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey&language=pt-BR';

    var res = await http.get(url, headers: {
      'Accept': 'application/json'
    });
    
    return json.decode(res.body);
  }

}
