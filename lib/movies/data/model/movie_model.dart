import 'package:movie_app/movies/domain/entity/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.backdroppath,
      required super.genreIds,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate});

  factory MovieModel.fromjson(Map<String, dynamic> json) => MovieModel(
      id: json['id'],
      title: json['title'],
      backdroppath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      overview: json['overview'],
      voteAverage: json['vote_average'],
      releaseDate: json['release_date']);
}
