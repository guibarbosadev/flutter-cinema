
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
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                buildMovieImage(movie.posterUrl),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 74.0, left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildMovieTitle(context, movie.title ?? ''),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: _buildMovieDuration(context, movie.duration),
                        ),
                        Wrap(
                            direction: Axis.horizontal,
                            children:
                                List.generate(movie.genres.length, (int index) {
                              return _buildMovieGenre(
                                  context, movie.genres[index]);
                            }))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Container _buildMovieGenre(BuildContext context, MovieGenre gender) {
    return Container(
      key: Key(gender.id.toString()),
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.only(top: 10.0, right: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38, width: 1.0),
      ),
      child: Text(
        gender.name,
        style: Theme.of(context)
            .textTheme
            .body1
            .copyWith(fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
    );
  }

  Text _buildMovieDuration(BuildContext context, int rawDuration) {
    Duration duration = Duration(minutes: rawDuration);
    int minutes = duration.inMinutes - duration.inHours * 60;
    return Text(
      '${duration.inHours}h$minutes',
      style: Theme.of(context).textTheme.title,
    );
  }

  Text _buildMovieTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.display1,
    );
  }

  Widget buildMovieImage(String posterUrl) {
    return Image.network(
      posterUrl,
      height: 175.0,
      width: 150.0,
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
        onPressed: () {},
      ),
    );
  }

  _buildHeaderImage(BuildContext context, imageUrl) {
    return Container(
      height: 400.0,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 100.0),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
