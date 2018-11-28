import 'package:meta/meta.dart';

class Movie {
  final String title;
  final String description;
  final String imagePath;
  final double rate;
  

  Movie({
    @required this.title,
    @required this.description,
    @required this.rate,
    @required this.imagePath  
  });
}