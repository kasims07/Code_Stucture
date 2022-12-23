

import '../../../api_models/api_response.dart';
import '../model/address_list_model.dart';

abstract class ChangeAddressRepository{
  Future<ApiResponse<AddressListModel>> addresslist();
}