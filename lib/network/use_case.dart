import 'package:dio/dio.dart' hide Headers;
import 'package:movie_retrofit_api/model/popular.dart';
import 'package:movie_retrofit_api/network/rest_client.dart';
import 'package:movie_retrofit_api/util/failure.dart';
import 'package:movie_retrofit_api/util/response.dart';

class MovieUsecase {
  Dio dio;
  RestClient client;

  MovieUsecase() {
    dio = new Dio();
    client = new RestClient(dio);
  }
  
  Future<BaseModel<Popular>> getPopularMovies() async{
    Popular response;

    try {
      response = await client.getPopularMovies();
    } catch (error,stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(ServerError.withError(error:error));
    }

    return BaseModel()..data = response;
  }
}