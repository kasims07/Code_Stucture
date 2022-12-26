import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gfive/utils/stream_builder.dart';
import 'package:logger/logger.dart';

import '../../../../api_models/api_response.dart';
import '../model/add_address_model.dart';
import 'edit_address_repository.dart';

class EditAddressImpl extends EditAddressRepository {
  final _dio = GetIt.I<Dio>();

  @override
  Future<ApiResponse<AddAddressModel>> editaddress(data) async {
    try {

      final response = await _dio.put('user/update/address/${StreamUtil.addressid.value}/v1',data: data);
      final newsResponse = AddAddressModel.fromJson(response.data);
      return ApiResponse.success(data: newsResponse);
    } on DioError catch (error) {
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