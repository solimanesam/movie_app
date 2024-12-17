import 'package:dartz/dartz.dart';
import 'package:movie_app/core/erorr/failures.dart';
import 'package:movie_app/movies/domain/entity/movie.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure,List<Movie>>> getNowPlaying();
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
}
