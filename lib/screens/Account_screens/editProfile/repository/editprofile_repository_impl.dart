import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../../api_client/api_constans.dart';
import '../../../../api_models/api_response.dart';
import '../model/edit_profile_model.dart';
import 'editprofile_repository.dart';

class EditProfileImpl extends EditProfileRepository{
  final _dio = GetIt.I<Dio>();

  @override
  Future<ApiResponse<EditProfileModel>> editprofile(data) async {
    try{
      final response = await _dio.put(APIConstants.editprofile, data: data);
      final newsResponse = EditProfileModel.fromJson(response.data);
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