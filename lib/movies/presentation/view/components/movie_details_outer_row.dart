import 'package:flutter/material.dart';
import 'package:movie_app/movies/presentation/controller/bloc/movie_detail_bloc.dart';
import 'package:movie_app/movies/presentation/view/components/movie_details_row.dart';
import 'package:movie_app/movies/presentation/view/components/movie_run_time_widget.dart';

class MovieDetailsOuterRow extends StatelessWidget {
  const MovieDetailsOuterRow({
    super.key,
    required this.state,
  });

  final MovieDetailState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 2.0,
            horizontal: 8.0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(
            state.movieDetails!.releaseDate.split('-')[0],
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        MovieDetailsRow(state: state),
        const SizedBox(width: 16.0),
        MovieRunTimeWidget(state: state),
      ],
    );
  }
}

