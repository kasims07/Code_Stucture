
import '../../../api_models/api_response.dart';
import '../model/reschedule_booking_model.dart';

abstract class RescheduleBookingRepository{
  Future<ApiResponse<RescheduleBookingModel>> reschedulebooking(dynamic data, String id);
}