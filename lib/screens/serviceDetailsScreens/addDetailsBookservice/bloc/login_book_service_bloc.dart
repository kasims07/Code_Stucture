import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../api_models/api_error.dart';
import '../../../../api_models/api_status.dart';
import '../model/lb_service_model.dart';
import '../repository/lbservice_repository.dart';

part 'login_book_service_event.dart';
part 'login_book_service_state.dart';

class LoginBookServiceBloc extends Bloc<LoginBookServiceEvent, LoginBookServiceState> {
  final _repository = GetIt.I<LbserviceRepository>();
  LoginBookServiceBloc() : super(LoginBookServiceState()) {
    on<PerformLoginBookServiceEvent>(_perform);
  }
  void _perform(PerformLoginBookServiceEvent event, Emitter<LoginBookServiceState> emit) async {
    emit(LoginBookServiceState(isLoading: true));
    final response = await _repository.lbservice(event.data);
    print('REPONSE_STATUS ${response.status}');
    if (response.status == ApiStatus.success) {
      print('REPONSE_STATUS ${response.status}');


      emit(LoginBookServiceState(
          isCompleted: true,
          isLoading: false,
          model: response.data

      ));
    } else {
      emit(LoginBookServiceState(
        error: response.error,
        responseMsg: response.errorMsg,
        isFailed: true,
        isLoading: false,
        isCompleted: false,
      ));
    }


  }
}
