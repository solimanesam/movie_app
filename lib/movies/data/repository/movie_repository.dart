import 'package:dartz/dartz.dart';
import 'package:movie_app/core/erorr/exceptions.dart';
import 'package:movie_app/core/erorr/failures.dart';
import 'package:movie_app/movies/data/datasources/moviesremotedatasource.dart';
import 'package:movie_app/movies/domain/entity/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MovieRepository({required this.baseMoviesRemoteDataSource});
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
}
