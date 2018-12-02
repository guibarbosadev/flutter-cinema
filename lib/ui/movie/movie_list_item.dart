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
      child: IntrinsicHeight(
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            elevation: 4.0,
            child: Row(
              children: <Widget>[
                Image.network(
                  movie.imagePath,
                  width: 100.0,
                ),
                Container(width: 10.0),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      new Title(movie: movie),
                      new Description(movie: movie),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        movie.description,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        maxLines: 3,
        style: Theme.of(context).textTheme.body1,
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        movie.title,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
