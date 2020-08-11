import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_retrofit_api/model/popular.dart';
import 'package:movie_retrofit_api/network/use_case.dart';
import 'package:movie_retrofit_api/util/response.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit({
    this.usecase,
  }) : super(MovieInitial()){
    _getPopularMovies();
  }
    
  final MovieUsecase usecase;
    
  void _getPopularMovies() async {
    try {
      emit(LoadingState());
      final movies = await usecase.getPopularMovies();
      emit(LoadedState(movies));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
