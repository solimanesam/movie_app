import 'package:movie_app/movies/domain/entity/recommendation.dart';

class RecommendationsModel extends Recommendation {
  const RecommendationsModel({required super.backdropPath, required super.id});
  factory RecommendationsModel.fromjson(Map<String, dynamic> json) =>
      RecommendationsModel(
        id: json["id"],
        backdropPath:
            json["backdrop_path"] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg',
      );
}
