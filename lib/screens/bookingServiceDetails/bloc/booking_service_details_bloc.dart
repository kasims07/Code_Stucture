import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'booking_service_details_event.dart';
part 'booking_service_details_state.dart';

class BookingServiceDetailsBloc extends Bloc<BookingServiceDetailsEvent, BookingServiceDetailsState> {
  BookingServiceDetailsBloc() : super(BookingServiceDetailsInitial()) {
    on<BookingServiceDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
