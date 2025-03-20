import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/loading_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/presentation/controller/bloc/movie_detail_bloc.dart';
import 'package:movie_app/movies/presentation/view/components/movie_details_widget.dart';

class MovieDetailsBlocBuilder extends StatelessWidget {
  const MovieDetailsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        switch (state.requestStateEnum) {
          case RequestStateEnum.loading:
            return SliverToBoxAdapter(child: getLoadingWidget);
          case RequestStateEnum.loaded:
            return MovieDetailsWidget(state: state);
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
      },
    );
  }
}