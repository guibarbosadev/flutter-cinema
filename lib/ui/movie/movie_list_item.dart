import 'package:flutter/material.dart';
import 'package:cinema/model/movie.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  MovieListItem({@required this.movie, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Image.network(
            movie.imagePath,
            width: 100.0,
            fit: BoxFit.fitHeight,
          ),
          Expanded(
            child: Container(
              color: Colors.orange,
              child: Column(
                children: <Widget>[
                  Text(
                    movie.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    movie.description,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 6,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
