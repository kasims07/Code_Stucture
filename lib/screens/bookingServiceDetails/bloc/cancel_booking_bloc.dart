import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cancel_booking_event.dart';
part 'cancel_booking_state.dart';

class CancelBookingBloc extends Bloc<CancelBookingEvent, CancelBookingState> {
  CancelBookingBloc() : super(CancelBookingInitial()) {
    on<CancelBookingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
