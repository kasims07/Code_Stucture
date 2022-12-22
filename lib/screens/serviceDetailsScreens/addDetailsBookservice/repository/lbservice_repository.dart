import '../../../../api_models/api_response.dart';
import '../model/lb_service_model.dart';

abstract class LbserviceRepository{
  Future<ApiResponse<LbServiceModel>> lbservice(dynamic data);
}