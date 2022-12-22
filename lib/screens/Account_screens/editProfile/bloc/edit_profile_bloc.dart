import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../api_models/api_error.dart';
import '../../../../api_models/api_status.dart';
import '../model/edit_profile_model.dart';
import '../repository/editprofile_repository.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final _repository = GetIt.I<EditProfileRepository>();
  EditProfileBloc() : super(EditProfileState()) {
    on<PerformEditProfileEvent>(_perform);
  }
  void _perform(PerformEditProfileEvent event, Emitter<EditProfileState> emit) async {
    emit(EditProfileState(isLoading: true));
    final response = await _repository.editprofile(event.data);
    print('REPONSE_STATUS ${response.status}');
    if (response.status == ApiStatus.success) {
      print('REPONSE_STATUS ${response.status}');


      emit(EditProfileState(
          isCompleted: true,
          isLoading: false,
          model: response.data

      ));
    } else {
      emit(EditProfileState(
        error: response.error,
        responseMsg: response.errorMsg,
        isFailed: true,
        isLoading: false,
        isCompleted: false,
      ));
    }


  }
}
