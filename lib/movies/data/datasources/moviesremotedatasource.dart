import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/error/erorrmodel.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/movies/data/models/movie_details_model.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_details_use_case.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MovieModel>> getNowPlaying();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlaying() async {
    final Response response = await Dio().get(urlnowplaying);
    return getMoviesOrErrorFunction(response);
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final Response response = await Dio().get(urlpopular);
    return getMoviesOrErrorFunction(response);
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final Response response = await Dio().get(urltoprated);
    return getMoviesOrErrorFunction(response);
  }

  Future<List<MovieModel>> getMoviesOrErrorFunction(Response response) async {
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map(
        (jsonMovieModel) => MovieModel.fromjson(jsonMovieModel),
      ));
    } else {
      throw ServerException(erorrModel: ErorrModel.fromjson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final Response response =
        await Dio().get(movieDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromjson((response.data).map(
        (jsonMovieDetail) => MovieModel.fromjson(jsonMovieDetail),
      ));
    } else {
      throw ServerException(erorrModel: ErorrModel.fromjson(response.data));
    }
  }
}
