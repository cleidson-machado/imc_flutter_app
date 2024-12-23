class ApiResponseGeneric<T> {

  final T data;
  final bool error;
  final String errorMessage;

  ApiResponseGeneric({
    required this.data,
    required this.error,
    required this.errorMessage,
  });

}
