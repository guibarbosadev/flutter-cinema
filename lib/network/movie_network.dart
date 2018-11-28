import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cinema/constants.dart';

abstract class MovieNetwork {
  static Future<dynamic> listPopularMovie() async {
    String url = 'https://api.themoviedb.org/3/movie/popular';
    
    String params = '?api_key=$apiKey&language=pt-BR';
    url += params;
    var res = await http.get(url, headers: {'Accept': 'application/json'});
    return json.decode(res.body);
  }
}
