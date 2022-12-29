import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gfive/screens/bookingServiceDetails/repository/reschedule_repository.dart';

import '../../../api_models/api_response.dart';
import '../model/reschedule_booking_model.dart';

class RescheduleBookingImpl extends RescheduleBookingRepository{
  final _dio = GetIt.I<Dio>();

  @override
  Future<ApiResponse<RescheduleBookingModel>> reschedulebooking(data, id) async {
    try{
      final response = await _dio.put('user/booking/update/${id}/v1', data: data);
      final newsResponse = RescheduleBookingModel.fromJson(response.data);
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