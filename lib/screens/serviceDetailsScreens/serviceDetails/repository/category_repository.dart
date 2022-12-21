import '../../../../api_models/api_response.dart';
import '../model/category_model.dart';

abstract class CategoryRepository{
  Future<ApiResponse<CategoryModel>> category(String id);
}