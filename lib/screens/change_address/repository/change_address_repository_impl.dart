import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../api_client/api_constans.dart';
import '../../../api_models/api_response.dart';
import '../model/address_list_model.dart';
import 'change_address_repository.dart';

class ChangeAddressImpl extends ChangeAddressRepository{
  final _dio = GetIt.I<Dio>();

  @override
  Future<ApiResponse<AddressListModel>> addresslist() async {
    try{
      final response = await _dio.get(APIConstants.addresslist);
      final newsResponse = AddressListModel.fromJson(response.data);
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