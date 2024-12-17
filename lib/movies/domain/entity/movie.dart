import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdroppath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final double releaseDate;

  const Movie(
      {required this.id,
      required this.title,
      required this.backdroppath,
      required this.genreIds,
      required this.overview,
      required this.voteAverage,
      required this.releaseDate});

  @override
  List<Object?> get props =>
      [id, title, backdroppath, genreIds, overview, voteAverage, releaseDate];
}
