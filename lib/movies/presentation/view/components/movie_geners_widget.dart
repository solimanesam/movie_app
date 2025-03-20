import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/movies/domain/entity/genres.dart';
import 'package:movie_app/movies/presentation/controller/bloc/movie_detail_bloc.dart';

class MovieGenresWidget extends StatelessWidget {
  const MovieGenresWidget({
    super.key,
    required this.state,
  });

  final MovieDetailState state;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${AppString.genres}: ${_showMovieGenres(state.movieDetails!.genres)}',
      style: const TextStyle(
        color: Colors.white70,
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.2,
      ),
    );
  }
}

String _showMovieGenres(List<Genres> genres) {
  String result = '';
  for (var genre in genres) {
    result += '${genre.name}, ';
  }

  if (result.isEmpty) {
    return result;
  }

  return result.substring(0, result.length - 2);
}