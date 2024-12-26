part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestStateEnum requestStateEnum;
  final String movieDetailMessage;
  final List<Recommendation> recommendation;
  final RequestStateEnum recommendationsStateEnum;
  final String recommandationsMessage;
  const MovieDetailState(
      {this.recommendation = const [],
      this.recommendationsStateEnum = RequestStateEnum.loading,
      this.recommandationsMessage = '',
      this.movieDetailMessage = '',
      this.requestStateEnum = RequestStateEnum.loading,
      this.movieDetails});
  MovieDetailState copyWith(
      {MovieDetails? movieDetails,
      RequestStateEnum? requestStateEnum,
      String? movieDetailMessage,
      List<Recommendation>? recommendation,
      RequestStateEnum? recommendationsStateEnum,
      String? recommandationsMessage}) {
    return MovieDetailState(
        movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
        movieDetails: movieDetails ?? this.movieDetails,
        requestStateEnum: requestStateEnum ?? this.requestStateEnum,
        recommendation: recommendation ?? this.recommendation,
        recommandationsMessage:
            recommandationsMessage ?? this.recommandationsMessage,
        recommendationsStateEnum:
            recommendationsStateEnum ?? this.recommendationsStateEnum);
  }

  @override
  List<Object?> get props => [
        movieDetailMessage,
        movieDetails,
        requestStateEnum,
        recommendation,
        recommandationsMessage,
        recommendationsStateEnum
      ];
}
