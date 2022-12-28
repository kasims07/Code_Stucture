
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gfive/screens/Account_screens/editProfile/repository/upload_image_repository.dart';

import '../../../../api_client/api_constans.dart';
import '../../../../api_models/api_response.dart';
import '../model/image_upload_model.dart';



class UploadImageImpl extends UploadImageRepository{

  final _dio = GetIt.I<Dio>();

  @override
  Future<ApiResponse<UploadImageModel>> uploadImage(data) async {
    try {
      final response = await _dio.post(APIConstants.uploadimage, data: data);
      final newsResponse = UploadImageModel.fromJson(response.data);
      return ApiResponse.success(data: newsResponse);
    } on DioError catch (error) {
      print('MYERRORR $error');
      //return ApiResponse.error(error: ApiUtils.getApiError(error));
      final response = error.response;

      print('RESPONSE_ERRRORR ${error.response}');
      print('RESPONSE_ERRRORR ${response!.data['message']}');
      return ApiResponse.error(
          errorMsg: response.data['message']
      );
    }
  }

}