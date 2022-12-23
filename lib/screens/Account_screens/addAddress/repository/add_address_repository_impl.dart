import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../../api_client/api_constans.dart';
import '../../../../api_models/api_response.dart';
import '../model/add_address_model.dart';
import 'add_address_repository.dart';

class AddAddressImpl extends AddAddressRepository{
  final _dio = GetIt.I<Dio>();

  @override
  Future<ApiResponse<AddAddressModel>> addaddress(data) async {
    try{
      final response = await _dio.post(APIConstants.addaddress, data: data);
      final newsResponse = AddAddressModel.fromJson(response.data);
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