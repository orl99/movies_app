import 'package:flutter/material.dart';

// Swiper library
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies_app/widgets/Swiper_card.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en Cine'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _swiperCards()
          ],
        ),
      ),
    );
  }

  Widget _swiperCards() {
    return SwiperCardW(movies: [1,2,3,4,5]);
  }
}