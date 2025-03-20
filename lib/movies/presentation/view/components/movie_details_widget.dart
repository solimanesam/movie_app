import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/movies/presentation/controller/bloc/movie_detail_bloc.dart';
import 'package:movie_app/movies/presentation/view/components/movie_details_outer_row.dart';
import 'package:movie_app/movies/presentation/view/components/movie_geners_widget.dart';
import 'package:movie_app/movies/presentation/view/components/movie_image_widget.dart';
class MovieDetailsWidget extends StatelessWidget {
  final MovieDetailState state;
  const MovieDetailsWidget({
    super.key,required this.state
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 20,
      duration: const Duration(milliseconds: 500),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SliverList.list(
          children: [
            MovieImageWidget(state: state),
            Text(state.movieDetails!.title,
                style: GoogleFonts.poppins(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                )),
            const SizedBox(height: 8.0),
            MovieDetailsOuterRow(state: state),
            const SizedBox(height: 20.0),
            Text(
              state.movieDetails!.overview,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8.0),
            MovieGenresWidget(state: state),
          ],
        ),
      ),
    );
  }
}

