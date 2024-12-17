import 'package:dartz/dartz.dart';
import 'package:movie_app/core/erorr/failures.dart';
import 'package:movie_app/movies/domain/entity/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class GetTopRatedMoviesUsecase {
  BaseMovieRepository baseMovieRepository;
  GetTopRatedMoviesUsecase(this.baseMovieRepository);
  Future<Either<Failure, List<Movie>>> excute() async {
    return await baseMovieRepository.getTopRatedMovies();
  }
}
