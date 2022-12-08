import 'api_error.dart';
import 'api_status.dart';

class ApiResponse<T> {
  ApiStatus status;
  ApiError? error;
  T? data;
  String? errorMsg;

  ApiResponse({required this.status, this.error, this.data});

  ApiResponse.success({this.status = ApiStatus.success, this.data});

  ApiResponse.error({this.status = ApiStatus.error, this.error, this.errorMsg});
}
