import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../api_models/api_error.dart';
import '../../../api_models/api_status.dart';
import '../model/dashboard_model.dart';
import '../repository/dashboard_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final _repository = GetIt.I<DashboardRepository>();
  DashboardBloc() : super(DashboardState()) {
    on<PerformDashboardEvent>(_perform);
  }
  void _perform(PerformDashboardEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardState(isLoading: true));
    final response = await _repository.dashboard();
    print('REPONSE_STATUS ${response.status}');
    if (response.status == ApiStatus.success) {
      print('REPONSE_STATUS ${response.status}');


      emit(DashboardState(
          isCompleted: true,
          isLoading: false,
          model: response.data

      ));
    } else {
      emit(DashboardState(
        error: response.error,
        responseMsg: response.errorMsg,
        isFailed: true,
        isLoading: false,
        isCompleted: false,
      ));
    }


  }
}
