import '../../../../api_models/api_response.dart';

import '../model/image_upload_model.dart';

abstract class UploadImageRepository {
  Future<ApiResponse<UploadImageModel>>uploadImage(dynamic data);
}