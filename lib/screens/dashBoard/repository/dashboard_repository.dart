import '../../../api_models/api_response.dart';
import '../model/dashboard_model.dart';

abstract class DashboardRepository{
  Future<ApiResponse<AllCategoriesModel>> dashboard();
}