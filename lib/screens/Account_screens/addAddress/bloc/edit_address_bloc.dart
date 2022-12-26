import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../api_models/api_error.dart';
import '../../../../api_models/api_status.dart';
import '../model/add_address_model.dart';
import '../repository/edit_address_repository.dart';

part 'edit_address_event.dart';
part 'edit_address_state.dart';

class EditAddressBloc extends Bloc<EditAddressEvent, EditAddressState> {
  final _repository = GetIt.I<EditAddressRepository>();
  EditAddressBloc() : super(EditAddressState()) {
    on<PerformEditAddressEvent>(_perform);
  }
  void _perform(PerformEditAddressEvent event, Emitter<EditAddressState> emit) async {
    emit(EditAddressState(isLoading: true));
    final response = await _repository.editaddress(event.data);
    print('REPONSE_STATUS ${response.status}');
    if (response.status == ApiStatus.success) {
      print('REPONSE_STATUS ${response.status}');


      emit(EditAddressState(
          isCompleted: true,
          isLoading: false,
          model: response.data

      ));
    } else {
      emit(EditAddressState(
        error: response.error,
        responseMsg: response.errorMsg,
        isFailed: true,
        isLoading: false,
        isCompleted: false,
      ));
    }


  }
}
