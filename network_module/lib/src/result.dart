abstract class Result<T> {
  factory Result.success(T data) = _Success;

  factory Result.error(Exception e) = _Error;
}

class _Success<T> implements Result<T> {
  final T data;

  _Success(this.data);
}

class _Error<T> implements Result<T> {
  final Exception e;

  _Error(this.e);
}
