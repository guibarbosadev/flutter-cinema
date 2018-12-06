import 'package:cinema/model/cast.dart';
import 'package:cinema/model/movie_detailed.dart';
import 'package:cinema/network/movie_network.dart';
import 'package:cinema/ui/movie_details/movie_details_description.dart';
import 'package:cinema/ui/movie_details/movie_details_header.dart';
import 'package:cinema/ui/util/rounded_image.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatefulWidget {
  final int movieId;
  MovieDetailsPage({@required this.movieId});

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  MovieDetailed movie;
  List<Cast> casts;

  @override
  void initState() {
    _getMovieDetails(widget.movieId);
    super.initState();
  }

  void _getMovieDetails(int movieId) async {
    MovieNetwork.getMovieDetails(movieId).then((response) {
      setState(() {
        List data = response['casts']['cast'];
        movie = MovieDetailed.fromJson(response);
        casts = data.map((i) => Cast.fromJson(i)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return movie != null
        ? Scaffold(
            body: ListView(
              children: <Widget>[
                MovieDetailsHeader(movie: movie),
                MovieDetailsDescription(description: movie.description),
                SizedBox(
                  height: 120.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: casts.sublist(0, 10).length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(casts[index].profilePath),
                              radius: 40.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8.0),
                              child: Text(casts[index].name),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        : Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
