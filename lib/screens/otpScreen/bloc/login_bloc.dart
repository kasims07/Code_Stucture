import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api_models/api_error.dart';
import '../../../api_models/api_status.dart';
import '../../../constants/app_constants.dart';
import '../model/login_model.dart';
import '../repository/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _repository = GetIt.I<LoginRepository>();
  LoginBloc() : super(LoginState()) {
    on<PerformLoginEvent>(_perform);
  }
  void _perform(PerformLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginState(isLoading: true));
    final response = await _repository.agencyLogin();
    print('REPONSE_STATUS ${response.status}');
    if (response.status == ApiStatus.success) {
      print('REPONSE_STATUS ${response.status}');
      emit(LoginState(
          isCompleted: true,
          isLoading: false,
          model: response.data

      ));
    } else {
      emit(LoginState(
        error: response.error,
        responseMsg: response.errorMsg,
        isFailed: true,
        isLoading: false,
        isCompleted: false,
      ));
    }


  }

}


