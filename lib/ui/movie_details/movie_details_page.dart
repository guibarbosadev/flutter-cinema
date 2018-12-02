import 'package:cinema/model/movie.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;

  MovieDetailsPage({@required this.movie});

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          new HeaderImage(widget: widget),
          buildBackButton(context),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: <Widget>[
                  buildMovieImage(),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 74.0, left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          buildMovieTitle(context),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: buildMovieDuration(context),
                          ),
                          Row(
                            children: <Widget>[
                              buildMovieGender(context),
                              buildMovieGender(context)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildMovieGender(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.only(top: 10.0, right: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38, width: 1.0),
      ),
      child: Text(
        'Gênero',
        style: Theme.of(context)
            .textTheme
            .body1
            .copyWith(fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
    );
  }

  Text buildMovieDuration(BuildContext context) {
    return Text(
      'Duração',
      style: Theme.of(context).textTheme.title,
    );
  }

  Text buildMovieTitle(BuildContext context) {
    return Text(
      widget.movie.title,
      style: Theme.of(context).textTheme.display1,
    );
  }

  Container buildMovieImage() {
    return Container(
      height: 175.0,
      width: 150.0,
      color: Colors.purple,
    );
  }
}

Widget buildBackButton(BuildContext context) {
  return Positioned(
    left: 10.0,
    top: 25.0,
    child: IconButton(
      iconSize: 20.0,
      icon: Icon(Icons.arrow_back),
      color: Colors.white,
      onPressed: () {},
    ),
  );
}

class HeaderImage extends StatelessWidget {
  const HeaderImage({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final MovieDetailsPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 100.0),
      child: Image.network(
        widget.movie.imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
