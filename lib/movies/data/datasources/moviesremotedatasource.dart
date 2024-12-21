import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/error/erorrmodel.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/movies/data/model/movie_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MovieModel>> getNowPlaying();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
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
}
