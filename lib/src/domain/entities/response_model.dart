class ResponseModel<T> {
  final String message;
  final int status;
  final T data;

  const ResponseModel({
    required this.data,
    required this.message,
    required this.status,
  });

  ResponseModel fromJson({
    required Map<String, dynamic> json,
    required Function(T data) dataToJson,
    required T Function(dynamic data) dataFromJson,
  }) {
    return ResponseModel(
      data: dataFromJson.call(json['data']),
      message: json['message'],
      status: json['status'],
    );
  }
}
