part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieInitial extends MovieState {
  @override
  List<Object> get props => [];
}

class LoadingState extends MovieState {
  @override

  List<Object> get props => [];
}

class LoadedState extends MovieState {
  LoadedState(this.movies);

  final BaseModel<Popular> movies;

  @override
  List<Object> get props => [movies];
}

class ErrorState extends MovieState {
  @override
  List<Object> get props => [];
}
