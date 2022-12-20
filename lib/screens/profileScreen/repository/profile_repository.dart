

import '../../../api_models/api_response.dart';
import '../model/update_user_model.dart';

abstract class ProfileRepository{
  Future<ApiResponse<UpdateUserModel>> updateuser(dynamic data);
}