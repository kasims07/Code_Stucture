import '../../../../api_models/api_response.dart';
import '../model/subservice_model.dart';

abstract class SubserviceRepository{
  Future<ApiResponse<SubserviceModel>> subservice(String id);
}