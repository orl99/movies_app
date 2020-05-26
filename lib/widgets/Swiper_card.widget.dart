import 'package:flutter/material.dart';

// Swiper UI lib
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperCardW extends StatelessWidget {
  final List<dynamic> movies;
  SwiperCardW({ @required this.movies });

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemCount: this.movies.length,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network('http://via.placeholder.com/350x150', fit: BoxFit.cover,),
          );
        },
      ),
    );
  }
}