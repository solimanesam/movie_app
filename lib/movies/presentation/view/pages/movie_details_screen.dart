import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/movies/presentation/view/components/movie_details_component.dart';
import 'package:movie_app/movies/presentation/view/components/movie_details_image.dart';
import 'package:movie_app/movies/presentation/view/components/recommendation_movies_component.dart';

class MovieDetailsScreen extends StatelessWidget {
  final  int id;
  const MovieDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          MovieDetailsImage(),
          MovieDetailsComponent(),
          SliverPadding(
            sliver: SliverToBoxAdapter(
              child: Text(AppString.moreLikeThis,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  )),
            ),
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
          ),
          RecommendationMoviesComponent()
        ],
      ),
    );
  }
}
