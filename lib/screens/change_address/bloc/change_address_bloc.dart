import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../api_models/api_error.dart';
import '../../../api_models/api_status.dart';
import '../model/address_list_model.dart';
import '../repository/change_address_repository.dart';

part 'change_address_event.dart';
part 'change_address_state.dart';

class ChangeAddressBloc extends Bloc<ChangeAddressEvent, ChangeAddressState> {
  final _repository = GetIt.I<ChangeAddressRepository>();
  ChangeAddressBloc() : super(ChangeAddressState()) {
    on<PerformChangeAddressEvent>(_perform);
  }
  void _perform(PerformChangeAddressEvent event, Emitter<ChangeAddressState> emit) async {
    emit(ChangeAddressState(isLoading: true));
    final response = await _repository.addresslist();
    print('REPONSE_STATUS ${response.status}');
    if (response.status == ApiStatus.success) {
      print('REPONSE_STATUS ${response.status}');


      emit(ChangeAddressState(
          isCompleted: true,
          isLoading: false,
          model: response.data

      ));
    } else {
      emit(ChangeAddressState(
        error: response.error,
        responseMsg: response.errorMsg,
        isFailed: true,
        isLoading: false,
        isCompleted: false,
      ));
    }


  }
}
