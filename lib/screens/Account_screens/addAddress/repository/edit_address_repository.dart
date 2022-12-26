import '../../../../api_models/api_response.dart';
import '../model/add_address_model.dart';

abstract class EditAddressRepository{
  Future<ApiResponse<AddAddressModel>> editaddress(dynamic data);
}