import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../api_client/api_constans.dart';
import '../../../api_models/api_response.dart';
import '../model/feedback_model.dart';
import 'feedback_repository.dart';


class FeedbackImpl extends FeedbackRepository{
  final _dio = GetIt.I<Dio>();

  @override
  Future<ApiResponse<FeedbackModel>> feedback(data) async {
    try{
      final response = await _dio.post(APIConstants.feedback, data: data);
      final newsResponse = FeedbackModel.fromJson(response.data);
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