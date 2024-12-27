import 'package:movie_app/movies/domain/entity/genres.dart';

class GenresModel extends Genres {
  const GenresModel({required super.name, required super.id});
  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json["id"],
      name: json["name"],
    );
  }
}
