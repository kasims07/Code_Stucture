import '../../../../api_models/api_response.dart';
import '../model/edit_profile_model.dart';

abstract class EditProfileRepository{
  Future<ApiResponse<EditProfileModel>> editprofile(dynamic data);
}