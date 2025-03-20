import 'package:flutter/material.dart';
import 'package:movie_app/movies/presentation/controller/bloc/movie_detail_bloc.dart';

class MovieRunTimeWidget extends StatelessWidget {
  const MovieRunTimeWidget({
    super.key,
    required this.state,
  });

  final MovieDetailState state;

  @override
  Widget build(BuildContext context) {
    return Text(
      _showMovieRunTime(state.movieDetails!.runtime),
      style: const TextStyle(
        color: Colors.white70,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.2,
      ),
    );
  }
}

String _showMovieRunTime(int runtime) {
  final int hours = runtime ~/ 60;
  final int minutes = runtime % 60;

  if (hours > 0) {
    return '${hours}h ${minutes}m';
  } else {
    return '${minutes}m';
  }
}