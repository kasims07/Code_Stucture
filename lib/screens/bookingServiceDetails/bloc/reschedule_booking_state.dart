part of 'reschedule_booking_bloc.dart';




@immutable
class RescheduleBookingState {
  final bool isLoading;
  final bool isCompleted;
  final bool isFailed;
  final ApiError? error;
  final String? responseMsg;
  final RescheduleBookingModel? model;


  RescheduleBookingState({
    this.isLoading = false,
    this.error,
    this.responseMsg,
    this.isCompleted = false,
    this.isFailed = false,
    this.model
  });
}