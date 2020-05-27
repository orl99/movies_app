import 'package:flutter/material.dart';
import 'package:movies_app/services/movies.service.dart';

// Swiper library
import 'package:movies_app/widgets/Swiper_card.widget.dart';
import 'package:movies_app/widgets/movies_horizontal.widget.dart';

class HomePage extends StatelessWidget {

  final moviesServices =  new MoviesService();
  Size _screenSize;
  @override
  Widget build(BuildContext context) {
    this._screenSize = MediaQuery.of(context).size;
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperCards(),
            _footerW(context),
          ],
        ),
      ),
    );
  }

  Widget _swiperCards() {
    return FutureBuilder(
      future: this.moviesServices.getInCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return SwiperCardW(movies: snapshot.data, percentageSizeHeigth: 0.5, percentageSizeWidth: 0.7);
        } else {
          return this._loadingW(0.5);
        }
      },
    );
  }

  Widget _footerW(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(padding: EdgeInsets.all(10.0), child: Text('Peliculas Populares', style: Theme.of(context).textTheme.headline5,)),
          FutureBuilder(
            future: this.moviesServices.getPopular(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return MoviesHorizontalW(movies: snapshot.data);
                // return SwiperCardW(movies: snapshot.data, percentageSizeWidth: 0.3, percentageSizeHeigth: 0.2,);
              } else {
                return this._loadingW(0.2);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _loadingW (double percentageSize) {
    return Container(
      height: _screenSize.height * percentageSize,
      child: Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}