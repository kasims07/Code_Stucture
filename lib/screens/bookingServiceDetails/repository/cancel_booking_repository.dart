import '../../../api_models/api_response.dart';
import '../model/cancel_booking_model.dart';

abstract class CancelBookingRepository{
  Future<ApiResponse<CancelBookingModel>> cancelbooking(dynamic data, String id);
}