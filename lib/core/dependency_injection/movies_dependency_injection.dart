import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/datasources/moviesremotedatasource.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movie_app/movies/presentation/controller/bloc/movies_bloc.dart';

final GetIt sl = GetIt.instance;

class MoviesDependencyInjection {
  static void init() {
    //bloc
    sl.registerFactory(
      () => MoviesBloc(sl()),
    );
    //usecases
    sl.registerLazySingleton(
      () => GetNowPlayingUsecase(sl()),
    );
    //repositories
    sl.registerLazySingleton<BaseMovieRepository>(
      () => MovieRepository(sl()),
    );
    //data source
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
      () => MoviesRemoteDataSource(),
    );
  }
}
