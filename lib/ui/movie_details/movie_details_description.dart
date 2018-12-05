import 'package:flutter/material.dart';

class MovieDetailsDescription extends StatelessWidget {
  
  final String description;

  MovieDetailsDescription({@required this.description});

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
            description,
            style: Theme.of(context).textTheme.body2,
            maxLines: 6,
          )
        ],
      ),
    );
  }
}
