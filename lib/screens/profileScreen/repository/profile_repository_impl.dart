


import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gfive/screens/profileScreen/repository/profile_repository.dart';

import '../../../api_client/api_constans.dart';
import '../../../api_models/api_response.dart';
import '../model/update_user_model.dart';

class ProfileImpl extends ProfileRepository{
  final _dio = GetIt.I<Dio>();

  @override
  Future<ApiResponse<UpdateUserModel>> updateuser( data) async {
    try{
      final response = await _dio.put(APIConstants.updateuser, data: data);
      final newsResponse = UpdateUserModel.fromJson(response.data);
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