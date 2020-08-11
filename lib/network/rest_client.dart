import 'package:dio/dio.dart' hide Headers;
import 'package:movie_retrofit_api/model/popular.dart';
import 'package:movie_retrofit_api/util/constant.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl:"https://api.themoviedb.org/3")
abstract class RestClient {
  
  @GET("/movie/popular")
  @Headers(<String, dynamic>{
    "Authorization" : "Bearer $API_KEY"
  })
  Future<Popular> getPopularMovies();

  factory RestClient(Dio dio){
    dio.options = BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
    return _RestClient(dio, baseUrl:"https://api.themoviedb.org/3");
  }
}