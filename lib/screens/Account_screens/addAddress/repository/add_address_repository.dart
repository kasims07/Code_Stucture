import '../../../../api_models/api_response.dart';
import '../model/add_address_model.dart';

abstract class AddAddressRepository{
  Future<ApiResponse<AddAddressModel>> addaddress(dynamic data);
}