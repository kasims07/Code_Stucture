



import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gfive/screens/otpScreen/repository/login_repository.dart';

import '../../../api_client/api_constans.dart';
import '../../../api_models/api_response.dart';
import '../model/login_model.dart';



class LoginImpl extends LoginRepository{
  final _dio = GetIt.I<Dio>();

  @override
  Future<ApiResponse<LoginModel>> agencyLogin() async {
    try{
      final response = await _dio.post(APIConstants.login);
      final newsResponse = LoginModel.fromJson(response.data);
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