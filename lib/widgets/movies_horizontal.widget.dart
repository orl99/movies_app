import 'package:flutter/material.dart';
import 'package:movies_app/models/movies.mode.dart';

class MoviesHorizontalW extends StatelessWidget {

  final List<Movie> movies;
  Size _screenSize;

  MoviesHorizontalW({ @required this.movies });
  @override
  Widget build(BuildContext context) {
    this._screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.25,
      child: PageView(
        children: _moviesList(context),
        pageSnapping: false,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
      ),
    );
  }

  List<Widget>_moviesList(BuildContext context) {
    return this.movies.map((e) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 9,
              child: FractionallySizedBox(
                heightFactor: 1, 
                widthFactor: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    image: NetworkImage(e.getPosterImage()),
                    fit: BoxFit.cover,
                    height: 160.0,
                  ),
                ),
              )
            ),
            SizedBox(height: 10.0,),
            Flexible(
              flex: 1,
              child: FractionallySizedBox(
                child: Text(e.title, style: Theme.of(context).textTheme.caption, overflow:  TextOverflow.ellipsis,),
                widthFactor: 1,
                heightFactor: 1.5,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}