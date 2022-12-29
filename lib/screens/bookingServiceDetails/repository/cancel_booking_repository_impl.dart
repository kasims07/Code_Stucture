import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../api_models/api_response.dart';
import '../model/cancel_booking_model.dart';
import 'cancel_booking_repository.dart';

class CancelBookingImpl extends CancelBookingRepository{
  final _dio = GetIt.I<Dio>();

  @override
  Future<ApiResponse<CancelBookingModel>> cancelbooking(data, id) async {
    try{
      final response = await _dio.put('user/booking/update/${id}/v1', data: data);
      final newsResponse = CancelBookingModel.fromJson(response.data);
      return ApiResponse.success(data: newsResponse);
    }on DioError catch(error){
      print('MYERRORS $error');
      final response = error.response;
      print('RESPONSE_ERRORS ${error.response}');
      print('RESPONSE_ERRORS ${response!.data['message']}');
      return ApiResponse.error(
          errorMsg: response.data['message']
      );
    }
  }
}