part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestStateEnum requestStateEnum;
  final String movieDetailMessage;
  const MovieDetailState(
      {this.movieDetailMessage = '',
      this.requestStateEnum = RequestStateEnum.loading,
      this.movieDetails});
  MovieDetailState copyWith(
      {MovieDetails? movieDetails,
      RequestStateEnum? requestStateEnum,
      String? movieDetailMessage}) {
    return MovieDetailState(
        movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
        movieDetails: movieDetails ?? this.movieDetails,
        requestStateEnum: requestStateEnum ?? this.requestStateEnum);
  }

  @override
  List<Object?> get props =>
      [movieDetailMessage, movieDetails, requestStateEnum];
}
