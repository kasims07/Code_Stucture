import '../../../api_models/api_response.dart';
import '../model/booking_history_model.dart';


abstract class BookingHistoryRepository{
  Future<ApiResponse<BookingHistoryModel>> bookinghistory();
}