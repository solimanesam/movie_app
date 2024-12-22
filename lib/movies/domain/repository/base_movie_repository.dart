import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/movies/domain/entity/movie.dart';
import 'package:movie_app/movies/domain/entity/movie_details.dart';
import 'package:movie_app/movies/domain/entity/recommendation.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movie_app/movies/domain/usecases/get_recommendation_movies_use_case.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlaying();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure, List<Recommendation>>> getRecommendationMovies(RecommendationParameters parameters);
}
