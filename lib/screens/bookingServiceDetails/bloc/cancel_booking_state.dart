part of 'cancel_booking_bloc.dart';






@immutable
class CancelBookingState {
  final bool isLoading;
  final bool isCompleted;
  final bool isFailed;
  final ApiError? error;
  final String? responseMsg;
  final CancelBookingModel? model;


  CancelBookingState({
    this.isLoading = false,
    this.error,
    this.responseMsg,
    this.isCompleted = false,
    this.isFailed = false,
    this.model
  });
}