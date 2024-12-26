import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entity/movie_details.dart';
import 'package:movie_app/movies/domain/entity/recommendation.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movie_app/movies/domain/usecases/get_recommendation_movies_use_case.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationMoviesUseCase getRecommendationMoviesUseCase;
  MovieDetailBloc(
      this.getMovieDetailsUseCase, this.getRecommendationMoviesUseCase)
      : super(const MovieDetailState()) {
    on<GetMovieDetailsEvent>(getMovieDetails);
    on<GetMovieRecommendationsEvent>(getRecommendations);
  }

  FutureOr<void> getMovieDetails(GetMovieDetailsEvent event, emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            requestStateEnum: RequestStateEnum.erorr,
            movieDetailMessage: l.message)),
        (r) => emit(state.copyWith(
            movieDetails: r, requestStateEnum: RequestStateEnum.loaded)));
  }

  FutureOr<void> getRecommendations(
      GetMovieRecommendationsEvent event, emit) async {
    final result = await getRecommendationMoviesUseCase(
        RecommendationParameters(event.id));
    result.fold(
        (l) => emit(state.copyWith(
            recommendationsStateEnum: RequestStateEnum.erorr,
            movieDetailMessage: l.message)),
        (r) => emit(state.copyWith(
            recommendation: r,
            recommendationsStateEnum: RequestStateEnum.loaded)));
  }
}
