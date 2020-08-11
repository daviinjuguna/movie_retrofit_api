import 'package:movie_retrofit_api/util/failure.dart';

class BaseModel<T> {
  ServerError _error;
  T data;

  setException(ServerError error) {
    _error = error;
  }

  setData(T data) {
    this.data = data;
  }

  get getException {
    return _error;
  }
}