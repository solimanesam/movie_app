part of 'movie_detail_bloc.dart';

sealed class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}  

class GetMovieDetailsEvent extends MovieDetailEvent{
 final int id;
 const GetMovieDetailsEvent(this.id);
  @override
  List<Object> get props => [id];
}
class GetMovieRecommendationsEvent extends MovieDetailEvent{
 final int id;
 const GetMovieRecommendationsEvent(this.id);
  @override
  List<Object> get props => [id];
}
