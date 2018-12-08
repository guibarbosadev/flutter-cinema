import 'package:cinema/model/movie_detailed.dart';
import 'package:cinema/model/movie_genre.dart';
import 'package:flutter/material.dart';

class MovieDetailsHeader extends StatelessWidget {
  const MovieDetailsHeader({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final MovieDetailed movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildHeaderImage(context, movie.backdropUrl),
        _buildBackButton(context),
        Positioned(
          bottom: 0,
          left: 16.0,
          right: 16.0,
          child: Row(
            children: <Widget>[
              _buildMovieImage(movie.posterUrl),
              Expanded(
                child: Container(
                  height: 215.0,
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 35.0),
                      _buildMovieTitle(context, movie.title ?? ''),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: _buildMovieDuration(context, movie.duration),
                      ),
                      _buildMovieGenreList(context, movie.genres),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMovieGenreList(BuildContext context, List<MovieGenre> genres) {
    return Wrap(
        direction: Axis.horizontal,
        children: List.generate(genres.length, (int index) {
          return Container(
            key: Key(genres[index].id.toString()),
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(top: 10.0, right: 10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black38, width: 1.0),
            ),
            child: Text(
              genres[index].name,
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
          );
        }));
  }

  Text _buildMovieDuration(BuildContext context, int rawDuration) {
    Duration duration = Duration(minutes: rawDuration);
    int minutes = duration.inMinutes - duration.inHours * 60;
    return Text(
      '${duration.inHours}h$minutes',
      style: Theme.of(context).textTheme.title,
    );
  }

  Widget _buildMovieTitle(BuildContext context, String title) {
    return Container(
      child: Text(title,
          style: Theme.of(context).textTheme.title.copyWith(fontSize: 20.0)),
    );
  }

  Widget _buildMovieImage(String posterUrl) {
    return Image.network(
      posterUrl,
      width: 150.0,
      height: 195.0,
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      left: 10.0,
      top: 25.0,
      child: IconButton(
        iconSize: 30.0,
        icon: Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  _buildHeaderImage(BuildContext context, imageUrl) {
    return Padding(
      padding: EdgeInsets.only(bottom: 180.0),
      child: Image.network(
        imageUrl,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        height: 250.0,
      ),
    );
  }
}
