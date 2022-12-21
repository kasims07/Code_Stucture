import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../../api_client/api_constans.dart';
import '../../../../api_models/api_response.dart';
import '../model/category_model.dart';
import 'category_repository.dart';

class CategoryImpl extends CategoryRepository{
  final _dio = GetIt.I<Dio>();

  @override
  Future<ApiResponse<CategoryModel>> category(id) async {
    try{
      final response = await _dio.get('user/category/getCategory/${id}/v1');
      final newsResponse = CategoryModel.fromJson(response.data);
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