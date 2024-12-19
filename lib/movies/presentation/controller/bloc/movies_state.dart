part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final String nowPlayingmessage;
  final RequestStateEnum nowPlayingMoviesState;
  final List<Movie> popularMovies;
  final String popularmessage;
  final RequestStateEnum popularMoviesState;
  final List<Movie> topRatedMovies;
  final String topRatedmessage;
  final RequestStateEnum topRatedMoviesState;
  const MoviesState(
      {this.nowPlayingMovies = const [],
      this.nowPlayingmessage = '',
      this.nowPlayingMoviesState = RequestStateEnum.loading,
      this.popularMovies = const [],
      this.popularmessage = '',
      this.popularMoviesState = RequestStateEnum.loading,
      this.topRatedMovies = const [],
      this.topRatedmessage = '',
      this.topRatedMoviesState = RequestStateEnum.loading});

  MoviesState copywith({
    List<Movie>? nowPlayingMovies,
    String? nowPlayingmessage,
    RequestStateEnum? nowPlayingMoviesState,
    List<Movie>? popularMovies,
    String? popularmessage,
    RequestStateEnum? popularMoviesState,
    List<Movie>? topRatedMovies,
    String? topRatedmessage,
    RequestStateEnum? topRatedMoviesState,
  }) {
    return MoviesState(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingmessage: nowPlayingmessage ?? this.nowPlayingmessage,
        nowPlayingMoviesState:
            nowPlayingMoviesState ?? this.nowPlayingMoviesState,
        popularMovies: popularMovies ?? this.popularMovies,
        popularmessage: popularmessage ?? this.popularmessage,
        popularMoviesState: popularMoviesState ?? this.popularMoviesState,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedmessage: popularmessage ?? this.topRatedmessage,
        topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState);
  }

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingmessage,
        nowPlayingMoviesState,
        popularMovies,
        popularmessage,
        popularMoviesState,
        topRatedMovies,
        topRatedmessage,
        topRatedMoviesState
      ];
}
