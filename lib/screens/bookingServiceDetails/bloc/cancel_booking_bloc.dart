import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../api_models/api_error.dart';
import '../../../api_models/api_status.dart';
import '../model/cancel_booking_model.dart';
import '../repository/cancel_booking_repository.dart';

part 'cancel_booking_event.dart';
part 'cancel_booking_state.dart';

class CancelBookingBloc extends Bloc<CancelBookingEvent, CancelBookingState> {
  final _repository = GetIt.I<CancelBookingRepository>();
  CancelBookingBloc() : super(CancelBookingState()) {
    on<PerformCancelBookingEvent>(_perform);
  }
  void _perform(PerformCancelBookingEvent event, Emitter<CancelBookingState> emit) async {
    emit(CancelBookingState(isLoading: true));
    final response = await _repository.cancelbooking(event.data, event.id);
    print('REPONSE_STATUS ${response.status}');
    if (response.status == ApiStatus.success) {
      print('REPONSE_STATUS ${response.status}');


      emit(CancelBookingState(
          isCompleted: true,
          isLoading: false,
          model: response.data

      ));
    } else {
      emit(CancelBookingState(
        error: response.error,
        responseMsg: response.errorMsg,
        isFailed: true,
        isLoading: false,
        isCompleted: false,
      ));
    }


  }
}
