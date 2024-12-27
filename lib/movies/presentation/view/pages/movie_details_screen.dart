import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/dependency_injection/movies_dependency_injection.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/movies/presentation/controller/bloc/movie_detail_bloc.dart';
import 'package:movie_app/movies/presentation/view/components/movie_details_component.dart';
import 'package:movie_app/movies/presentation/view/components/recommendation_movies_component.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int id;
  const MovieDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MovieDetailBloc(sl(), sl())
          ..add(GetMovieRecommendationsEvent(id))
          ..add(GetMovieDetailsEvent(id)),
        child:  const Scaffold(
          body: SingleChildScrollView(
              child: Column(children: [
            MovieDetailsComponent(),
            Text(AppString.moreLikeThis,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                )),
            RecommendationMoviesComponent(),
          ])),
        ));
  }
}
