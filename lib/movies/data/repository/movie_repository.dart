import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/movies/data/datasources/moviesremotedatasource.dart';
import 'package:movie_app/movies/domain/entity/movie.dart';
import 'package:movie_app/movies/domain/entity/movie_details.dart';
import 'package:movie_app/movies/domain/entity/recommendation.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movie_app/movies/domain/usecases/get_recommendation_movies_use_case.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MovieRepository(this.baseMoviesRemoteDataSource);
  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    try {
      return right(await baseMoviesRemoteDataSource.getNowPlaying());
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.erorrModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      return right(await baseMoviesRemoteDataSource.getPopularMovies());
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.erorrModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      return right(await baseMoviesRemoteDataSource.getTopRatedMovies());
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.erorrModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    try {
      return right(
          await baseMoviesRemoteDataSource.getMovieDetails(parameters));
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.erorrModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendationMovies(
      RecommendationParameters parameters) async {
    try {
      return right(
          await baseMoviesRemoteDataSource.GetRecommendation(parameters));
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.erorrModel.statusMessage));
    }
  }
}
