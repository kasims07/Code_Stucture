part of 'cancel_booking_bloc.dart';



@immutable
abstract class CancelBookingEvent {
  const CancelBookingEvent();
}


class PerformCancelBookingEvent extends CancelBookingEvent {
  final String id;
  final dynamic data;
  const PerformCancelBookingEvent({required this.id, required this.data});
}