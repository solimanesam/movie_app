import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entity/movie.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUsecase getNowPlayingUsecase;

  MoviesBloc(this.getNowPlayingUsecase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingUsecase.excute();
      result.fold(
        (failure) => emit(MoviesState(
            nowPlayingMoviesState: RequestStateEnum.erorr,
            nowPlayingmessage: failure.message)),
        (nowPlayingMovies) => emit(MoviesState(
            nowPlayingMoviesState: RequestStateEnum.loaded,
            nowPlayingMovies: nowPlayingMovies)),
      );
    });
  }
}
