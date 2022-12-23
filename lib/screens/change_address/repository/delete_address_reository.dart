


import '../../../api_models/api_response.dart';
import '../model/delete_address_model.dart';

abstract class DeleteAddressRepository{
  Future<ApiResponse<DeleteAddressModel>> deleteaddress(dynamic id);
}