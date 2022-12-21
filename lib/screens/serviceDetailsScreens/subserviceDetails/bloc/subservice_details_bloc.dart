import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../api_models/api_error.dart';
import '../../../../api_models/api_status.dart';
import '../model/subservice_model.dart';
import '../repository/subservice_repository.dart';

part 'subservice_details_event.dart';
part 'subservice_details_state.dart';

class SubserviceDetailsBloc extends Bloc<SubserviceDetailsEvent, SubserviceDetailsState> {
  final _repository = GetIt.I<SubserviceRepository>();
  SubserviceDetailsBloc() : super(SubserviceDetailsState()) {
    on<PerformSubserviceDetailsEvent>(_perform);
  }
  void _perform(PerformSubserviceDetailsEvent event, Emitter<SubserviceDetailsState> emit) async {
    emit(SubserviceDetailsState(isLoading: true));
    final response = await _repository.subservice(event.id);
    print('REPONSE_STATUS ${response.status}');
    if (response.status == ApiStatus.success) {
      print('REPONSE_STATUS ${response.status}');


      emit(SubserviceDetailsState(
          isCompleted: true,
          isLoading: false,
          model: response.data

      ));
    } else {
      emit(SubserviceDetailsState(
        error: response.error,
        responseMsg: response.errorMsg,
        isFailed: true,
        isLoading: false,
        isCompleted: false,
      ));
    }


  }
}
