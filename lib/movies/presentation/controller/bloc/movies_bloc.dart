import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entity/movie.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUsecase getNowPlayingUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  MoviesBloc(this.getNowPlayingUsecase, this.getPopularMoviesUsecase,
      this.getTopRatedMoviesUsecase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(getNowPlayingMovies);
    on<GetPopularMoviesEvent>(getPopularMovies);
    on<GetTopRatedMoviesEvent>(getTopRatedMovies);
  }

  Future<void> getNowPlayingMovies(GetNowPlayingMoviesEvent event, emit) async {
    final result = await getNowPlayingUsecase.excute();
    result.fold(
      (failure) => emit(state.copywith(
          nowPlayingMoviesState: RequestStateEnum.erorr,
          nowPlayingmessage: failure.message)),
      (nowPlayingMovies) => emit(state.copywith(
          nowPlayingMoviesState: RequestStateEnum.loaded,
          nowPlayingMovies: nowPlayingMovies)),
    );
  }

  Future<void> getPopularMovies(GetPopularMoviesEvent event, emit) async {
    final result = await getPopularMoviesUsecase.excute();
    result.fold(
      (failure) => emit(state.copywith(
          popularMoviesState: RequestStateEnum.erorr,
          popularmessage: failure.message)),
      (popularMovies) => emit(state.copywith(
          popularMoviesState: RequestStateEnum.loaded,
          popularMovies: popularMovies)),
    );
  }

  Future<void> getTopRatedMovies(GetTopRatedMoviesEvent event, emit) async {
    final result = await getTopRatedMoviesUsecase.excute();
    result.fold(
      (failure) => emit(state.copywith(
          topRatedMoviesState: RequestStateEnum.erorr,
          topRatedmessage: failure.message)),
      (topRatedMovies) => emit(state.copywith(
          topRatedMoviesState: RequestStateEnum.loaded,
          topRatedMovies: topRatedMovies)),
    );
  }
}
