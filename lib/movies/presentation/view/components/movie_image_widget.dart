import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/movies/presentation/controller/bloc/movie_detail_bloc.dart';

class MovieImageWidget extends StatelessWidget {
  const MovieImageWidget({
    super.key,
    required this.state,
  });

  final MovieDetailState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
