part of 'booking_history_bloc.dart';




@immutable
class BookingHistoryState {
  final bool isLoading;
  final bool isCompleted;
  final bool isFailed;
  final ApiError? error;
  final String? responseMsg;
  final BookingHistoryResponsModel? model;


  BookingHistoryState({
    this.isLoading = false,
    this.error,
    this.responseMsg,
    this.isCompleted = false,
    this.isFailed = false,
    this.model
  });
}