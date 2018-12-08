import 'package:flutter/material.dart';

class MovieDetailsDescription extends StatefulWidget {
  final String description;

  MovieDetailsDescription({@required this.description});

  @override
  MovieDetailsDescriptionState createState() {
    return new MovieDetailsDescriptionState();
  }
}

class MovieDetailsDescriptionState extends State<MovieDetailsDescription> {
  bool shouldExpand = false;
  String expandText = 'Ler mais';

  _toggleShouldExpand() {
    setState(() {
      shouldExpand = !shouldExpand;
      expandText = shouldExpand ? 'Ler menos' : 'Ler mais';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Descrição',
            style: Theme.of(context).textTheme.title,
          ),
          Text(
            widget.description,
            style: Theme.of(context).textTheme.body1.copyWith(fontSize: 16.0),
            maxLines: shouldExpand ? null : 3,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
              child: OutlineButton(
                child: Text(expandText),
                onPressed: _toggleShouldExpand,
              ),
            ),
          )
        ],
      ),
    );
  }
}
