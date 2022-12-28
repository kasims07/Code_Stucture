import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../api_models/api_error.dart';
import '../../../api_models/api_status.dart';
import '../model/booking_history_model.dart';
import '../repository/booking_history_repository.dart';

part 'booking_history_event.dart';
part 'booking_history_state.dart';

class BookingHistoryBloc extends Bloc<BookingHistoryEvent, BookingHistoryState> {
  final _repository = GetIt.I<BookingHistoryRepository>();
  BookingHistoryBloc() : super(BookingHistoryState()) {
    on<PerformBookingHistoryEvent>(_perform);
  }
  void _perform(PerformBookingHistoryEvent event, Emitter<BookingHistoryState> emit) async {
    emit(BookingHistoryState(isLoading: true));
    final response = await _repository.bookinghistory();
    print('REPONSE_STATUS ${response.status}');
    if (response.status == ApiStatus.success) {
      print('REPONSE_STATUS ${response.status}');


      emit(BookingHistoryState(
          isCompleted: true,
          isLoading: false,
          model: response.data

      ));
    } else {
      emit(BookingHistoryState(
        error: response.error,
        responseMsg: response.errorMsg,
        isFailed: true,
        isLoading: false,
        isCompleted: false,
      ));
    }


  }
}
