import '../../../api_models/api_response.dart';
import '../model/feedback_model.dart';

abstract class FeedbackRepository{
  Future<ApiResponse<FeedbackModel>> feedback(dynamic data);
}