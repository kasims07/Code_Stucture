import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reschedule_booking_event.dart';
part 'reschedule_booking_state.dart';

class RescheduleBookingBloc extends Bloc<RescheduleBookingEvent, RescheduleBookingState> {
  RescheduleBookingBloc() : super(RescheduleBookingInitial()) {
    on<RescheduleBookingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
