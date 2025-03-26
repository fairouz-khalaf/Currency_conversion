class Result<T> {
  final T? data;
  final String? error;

  const Result._({this.data, this.error});

  // Factory methods to create success or error instances
  factory Result.success(T data) => Result._(data: data);

  factory Result.failure(String error) => Result._(error: error);

  bool get isSuccess => data != null;

  bool get isError => error != null;

  // `when` method to handle success and error cases
  R when<R>({
    required R Function(T data) success,
    required R Function(String error) failure,
  }) {
    if (isSuccess) {
      return success(data as T);
    } else if (isError) {
      return failure(error!);
    }
    throw Exception('Unhandled state');
  }
}
