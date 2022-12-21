import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gfive/screens/serviceDetailsScreens/subserviceDetails/repository/subservice_repository.dart';

import '../../../../api_models/api_response.dart';
import '../model/subservice_model.dart';

class SubserviceImpl extends SubserviceRepository{
  final _dio = GetIt.I<Dio>();

  @override
  Future<ApiResponse<SubserviceModel>> subservice(id) async {
    try{
      final response = await _dio.get('user/get/subservices/${id}/with/include/prize/v1');
      final newsResponse = SubserviceModel.fromJson(response.data);
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

