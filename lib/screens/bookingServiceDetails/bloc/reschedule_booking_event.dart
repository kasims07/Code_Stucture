part of 'reschedule_booking_bloc.dart';




@immutable
abstract class RescheduleBookingEvent {
  const RescheduleBookingEvent();
}


class PerformRescheduleBookingEvent extends RescheduleBookingEvent {
  final String id;
  final dynamic data;
  const PerformRescheduleBookingEvent({required this.id, required this.data});
}