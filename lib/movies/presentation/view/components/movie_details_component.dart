import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/loading_widget.dart';
import 'package:movie_app/movies/domain/entity/genres.dart';
import 'package:movie_app/movies/presentation/controller/bloc/movie_detail_bloc.dart';

class MovieDetailsComponent extends StatelessWidget {
  const MovieDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        switch (state.requestStateEnum) {
          case RequestStateEnum.loading:
            return getLoadingWidget;
          case RequestStateEnum.loaded:
            return FadeInUp(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250.0,
                      child: FadeIn(
                        duration: const Duration(milliseconds: 500),
                        child: ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                              ],
                              stops: [0.0, 0.5, 1.0, 1.0],
                            ).createShader(
                              Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                            );
                          },
                          blendMode: BlendMode.dstIn,
                          child: CachedNetworkImage(
                            width: MediaQuery.of(context).size.width,
                            imageUrl:
                                imageUrl(state.movieDetails!.backdropPath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Text(state.movieDetails!.title,
                        style: GoogleFonts.poppins(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        )),
                    const SizedBox(height: 8.0),
                    Row(
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
                        Row(
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
                        ),
                        const SizedBox(width: 16.0),
                        Text(
                          _showMovieRunTime(state.movieDetails!.runtime),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
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
                    Text(
                      '${AppString.genres}: ${_showMovieGenres(state.movieDetails!.genres)}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            );
          case RequestStateEnum.erorr:
            return SizedBox(
              height: 400.0,
              child: Center(
                child: Text(state.movieDetailMessage),
              ),
            );
        }
      },
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
