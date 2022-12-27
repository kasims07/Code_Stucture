part of 'booking_history_bloc.dart';


@immutable
abstract class BookingHistoryEvent {
  const BookingHistoryEvent();
}


class PerformBookingHistoryEvent extends BookingHistoryEvent {
  const PerformBookingHistoryEvent();
}