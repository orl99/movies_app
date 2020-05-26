
class Results {
  List<Movie> results;
  int page;
  int totalResults;
  String dates;
  int totalPages;

  Results({
    this.results,
    this.page,
    this.totalResults,
    this.dates,
    this.totalPages,
  });
}
class Movies {
  List<Movie> items = new List();

  Movies.fromJsonList( List<dynamic> json ) {
    if (json ==  null) return;

    for (var item in json) {
      final movie = new Movie.fromJsonMap(item);
      items.add(movie);
    }
  }
}

class Movie {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Movie({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Movie.fromJsonMap( Map<String, dynamic> json ) {
    popularity        =  json['popularity'] / 1;
    voteCount         =  json['voteCount'];
    video             =  json['video'];
    posterPath        =  json['poster_path'];
    id                =  json['id'];
    adult             =  json['adult'];
    backdropPath      =  json['backdrop_path'];
    originalLanguage  =  json['original_language'];
    originalTitle     =  json['original_title'];
    genreIds          =  json['genre_ids'].cast<int>();
    title             =  json['title'];
    voteAverage       =  json['vote_average'] / 1;
    overview          =  json['overview'];
    releaseDate       =  json['release_date'];
  }
}
