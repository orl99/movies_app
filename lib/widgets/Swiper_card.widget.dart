import 'package:flutter/material.dart';

// Swiper UI lib
import 'package:flutter_swiper/flutter_swiper.dart';

// Models
import 'package:movies_app/models/movies.mode.dart';

class SwiperCardW extends StatelessWidget {
  final List<Movie> movies;
  final double percentageSizeWidth;
  final double percentageSizeHeigth;
  SwiperCardW({ @required this.movies, @required this.percentageSizeWidth, @required this.percentageSizeHeigth });

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * percentageSizeWidth,
        itemHeight: _screenSize.height * percentageSizeHeigth,
        itemCount: this.movies.length,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: NetworkImage('https://comnplayscience.eu/app/images/notfound.png'),
              image: NetworkImage(this.movies[index].getPosterImage()),
              fit: BoxFit.cover
            )
          );
        },
      ),
    );
  }
}