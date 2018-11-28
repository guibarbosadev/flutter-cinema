import 'package:flutter/material.dart';
import 'movie_list.dart'; 

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinema Club'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: MovieList(),
      ),
    );
  }
}