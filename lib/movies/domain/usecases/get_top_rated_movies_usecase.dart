import 'package:movie_app/movies/domain/entity/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class GetTopRatedMoviesUsecase {
  BaseMovieRepository baseMovieRepository;
  GetTopRatedMoviesUsecase(this.baseMovieRepository);
  Future<List<Movie>> excute() async {
    return await baseMovieRepository.getTopRatedMovies();
  }
}
