import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api_models/api_error.dart';
import '../../../api_models/api_status.dart';
import '../../../constants/app_constants.dart';
import '../model/update_user_model.dart';
import '../repository/profile_repository.dart';

part 'profile_screen_event.dart';
part 'profile_screen_state.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  final _repository = GetIt.I<ProfileRepository>();
  ProfileScreenBloc() : super(ProfileScreenState()) {
    on<PerformProfileScreenEvent>(_perform);
  }
  void _perform(PerformProfileScreenEvent event, Emitter<ProfileScreenState> emit) async {
    emit(ProfileScreenState(isLoading: true));
    final response = await _repository.updateuser(event.data);
    print('REPONSE_STATUS ${response.status}');
    if (response.status == ApiStatus.success) {
      print('REPONSE_STATUS ${response.status}');


      emit(ProfileScreenState(
          isCompleted: true,
          isLoading: false,
          model: response.data

      ));
    } else {
      emit(ProfileScreenState(
        error: response.error,
        responseMsg: response.errorMsg,
        isFailed: true,
        isLoading: false,
        isCompleted: false,
      ));
    }


  }
}
