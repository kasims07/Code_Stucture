import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../api_models/api_response.dart';
import '../model/delete_address_model.dart';
import 'delete_address_reository.dart';

class DeleteAddressImpl extends DeleteAddressRepository{
  final _dio = GetIt.I<Dio>();

  @override
  Future<ApiResponse<DeleteAddressModel>> deleteaddress(id) async {
    try{
      final response = await _dio.delete('/user/delete/address/${id}/v1');
      final newsResponse = DeleteAddressModel.fromJson(response.data);
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