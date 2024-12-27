import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/datasources/moviesremotedatasource.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_recommendation_movies_use_case.dart';
import 'package:movie_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movies/presentation/controller/bloc/movies_bloc.dart';

import '../../movies/presentation/controller/bloc/movie_detail_bloc.dart';

final GetIt sl = GetIt.instance;

class MoviesDependencyInjection {
  static void init() {
    //bloc
    sl.registerFactory(() => MovieDetailBloc(sl(), sl()));
    sl.registerFactory(
      () => MoviesBloc(sl(), sl(), sl()),
    );
    //usecases
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationMoviesUseCase(sl()));
    sl.registerLazySingleton(
      () => GetNowPlayingUsecase(sl()),
    );
    sl.registerLazySingleton(
      () => GetPopularMoviesUsecase(sl()),
    );
    sl.registerLazySingleton(
      () => GetTopRatedMoviesUsecase(sl()),
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
