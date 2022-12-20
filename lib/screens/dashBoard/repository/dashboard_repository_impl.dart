import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../api_client/api_constans.dart';
import '../../../api_models/api_response.dart';
import '../model/dashboard_model.dart';
import 'dashboard_repository.dart';

class DashboardImpl extends DashboardRepository{
  final _dio = GetIt.I<Dio>();

  @override
  Future<ApiResponse<AllCategoriesModel>> dashboard() async {
    try{
      final response = await _dio.get(APIConstants.dashboard);
      final newsResponse = AllCategoriesModel.fromJson(response.data);
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