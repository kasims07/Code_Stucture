import '../../../api_models/api_response.dart';
import '../model/BookingHistoryResponsModel.dart';

abstract class BookingHistoryRepository{
  Future<ApiResponse<BookingHistoryResponsModel>> bookinghistory();
}