import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_retrofit_api/cubit/movie_cubit.dart';
import 'package:movie_retrofit_api/network/use_case.dart';
import 'package:movie_retrofit_api/pages/MoviePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Popular Movies",
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:BlocProvider(
        create: (context) => MovieCubit(usecase: MovieUsecase()),
        child: MoviePage(),
      ),
    );
  }
}