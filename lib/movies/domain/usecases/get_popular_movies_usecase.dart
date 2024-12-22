import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/utils/base_use_case.dart';
import 'package:movie_app/movies/domain/entity/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class GetPopularMoviesUsecase extends BaseUseCase<List<Movie>, NoParameters> {
 final BaseMovieRepository baseMovieRepository;
  GetPopularMoviesUsecase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getPopularMovies();
  }
}
