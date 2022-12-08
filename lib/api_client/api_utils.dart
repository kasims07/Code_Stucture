import 'package:dio/dio.dart';

import '../api_models/api_error.dart';



class ApiUtils {
  ApiUtils._();

  static ApiError getApiError(DioError error) {
    final response = error.response;

    print('RESPONSE_ERRRORR ${error.response}');
    print('RESPONSE_ERRRORR ${response!.data['message']}');
    if (response != null) {
      final data = response.data;
      if (data != null) {
        return ApiError.fromJson(data);
      } else {
        return ApiError();
      }
    } else {
      print('RESPONSE_ERRRORRMM ${error.message}');
      return ApiError.fromMessage(error.message);
    }
  }
}
