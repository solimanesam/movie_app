import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/loading_widget.dart';
import 'package:movie_app/movies/presentation/controller/bloc/movie_detail_bloc.dart';
import 'package:shimmer/shimmer.dart';

class RecommendationMoviesComponent extends StatelessWidget {
  const RecommendationMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
      switch (state.recommendationsStateEnum) {
        case RequestStateEnum.loading:
          return SliverToBoxAdapter(child: getLoadingWidget);
        case RequestStateEnum.loaded:
          return SliverGrid.builder(
          itemBuilder :
              (context, index) {
                final recommendation = state.recommendation[index];
                return FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl(recommendation.backdropPath!),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Container(
                          height: 170.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              itemCount: state.recommendation.length,
            
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.7,
              crossAxisCount: 3,
            ),
          );
        case RequestStateEnum.erorr:
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 400.0,
              child: Center(
                child: Text(state.movieDetailMessage),
              ),
            ),
          );
      }
    });
  }
}
