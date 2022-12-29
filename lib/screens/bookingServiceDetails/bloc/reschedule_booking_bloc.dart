import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../api_models/api_error.dart';
import '../../../api_models/api_status.dart';
import '../model/reschedule_booking_model.dart';
import '../repository/reschedule_repository.dart';

part 'reschedule_booking_event.dart';
part 'reschedule_booking_state.dart';

class RescheduleBookingBloc extends Bloc<RescheduleBookingEvent, RescheduleBookingState> {
  final _repository = GetIt.I<RescheduleBookingRepository>();
  RescheduleBookingBloc() : super(RescheduleBookingState()) {
    on<PerformRescheduleBookingEvent>(_perform);
  }
  void _perform(PerformRescheduleBookingEvent event, Emitter<RescheduleBookingState> emit) async {
    emit(RescheduleBookingState(isLoading: true));
    final response = await _repository.reschedulebooking(event.data, event.id);
    print('REPONSE_STATUS ${response.status}');
    if (response.status == ApiStatus.success) {
      print('REPONSE_STATUS ${response.status}');


      emit(RescheduleBookingState(
          isCompleted: true,
          isLoading: false,
          model: response.data

      ));
    } else {
      emit(RescheduleBookingState(
        error: response.error,
        responseMsg: response.errorMsg,
        isFailed: true,
        isLoading: false,
        isCompleted: false,
      ));
    }


  }
}
