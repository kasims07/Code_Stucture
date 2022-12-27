import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../api_client/api_constans.dart';
import '../../../api_models/api_response.dart';
import '../model/BookingHistoryResponsModel.dart';
import 'booking_history_repository.dart';

class BookingHistoryImpl extends BookingHistoryRepository{
  final _dio = GetIt.I<Dio>();

  @override
  Future<ApiResponse<BookingHistoryResponsModel>> bookinghistory() async {
    try{
      final response = await _dio.get(APIConstants.bookinghistory);
      final newsResponse = BookingHistoryResponsModel.fromJson(response.data);
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