part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final String nowPlayingmessage;
  final RequestStateEnum nowPlayingMoviesState;
  const MoviesState(
      {this.nowPlayingMovies = const [],
      this.nowPlayingmessage = '',
      this.nowPlayingMoviesState = RequestStateEnum.loading});

  @override
  List<Object> get props =>
      [nowPlayingMovies, nowPlayingmessage, nowPlayingMoviesState];
}
