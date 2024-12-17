import 'package:movie_app/movies/domain/entity/movie.dart';

abstract class BaseMovieRepository {
  Future<List<Movie>> getNowPlaying();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
}
