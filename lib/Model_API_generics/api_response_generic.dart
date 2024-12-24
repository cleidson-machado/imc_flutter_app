class ApiResponseGeneric<T> {

  final T? data;
  final bool? error;
  final String? errorMessage;

  ApiResponseGeneric({
    this.data,
    this.error,
    this.errorMessage,
  });

}
