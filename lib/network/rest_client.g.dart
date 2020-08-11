// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://api.themoviedb.org/3';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getPopularMovies() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result =
        await _dio.request('/movie/popular',
            queryParameters: queryParameters,
            options: RequestOptions(
                method: 'GET',
                headers: <String, dynamic>{
                  r'Authorization':
                      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MTg1OGVjMWE4NDlhNzk3YTllM2E2NWY5MzE4OWFhMSIsInN1YiI6IjVlZjk5YzM1YTI4NGViMDAzNzhmMzY2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.jDFNb1kPQkV1X52KNQku8eC6TjSLLoL6qdmUK-V10Lc'
                },
                extra: _extra,
                baseUrl: baseUrl),
            data: _data);
    final value = Popular.fromJson(_result.data);
    return value;
  }
}
