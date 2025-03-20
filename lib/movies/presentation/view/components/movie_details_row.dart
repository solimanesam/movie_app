import 'package:flutter/material.dart';
import 'package:movie_app/movies/presentation/controller/bloc/movie_detail_bloc.dart';

class MovieDetailsRow extends StatelessWidget {
  const MovieDetailsRow({
    super.key,
    required this.state,
  });

  final MovieDetailState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 20.0,
        ),
        const SizedBox(width: 4.0),
        Text(
          (state.movieDetails!.voteAverage / 2)
              .toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(width: 4.0),
        Text(
          '(${state.movieDetails!.voteAverage})',
          style: const TextStyle(
            fontSize: 1.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}



