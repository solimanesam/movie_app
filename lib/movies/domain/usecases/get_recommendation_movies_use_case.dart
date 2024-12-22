import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/utils/base_use_case.dart';
import 'package:movie_app/movies/domain/entity/recommendation.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class GetRecommendationMoviesUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationMoviesUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await baseMovieRepository.getRecommendationMovies(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object> get props => [id];
}
