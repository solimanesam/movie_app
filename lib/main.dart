import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/dependency_injection/movies_dependency_injection.dart';
import 'package:movie_app/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:movie_app/movies/presentation/view/pages/movie_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MoviesDependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              MoviesBloc(sl(), sl(), sl())..add(GetNowPlayingMoviesEvent())..add(GetPopularMoviesEvent())..add(GetTopRatedMoviesEvent()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MoviesScreen(),
      ),
    );
  }
}
