import 'package:cinema/model/cast.dart';
import 'package:flutter/material.dart';

class CastList extends StatelessWidget {
  const CastList({
    Key key,
    @required this.casts,
  }) : super(key: key);

  final List<Cast> casts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
