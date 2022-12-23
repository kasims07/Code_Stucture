import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../api_models/api_error.dart';
import '../../../api_models/api_status.dart';
import '../model/delete_address_model.dart';
import '../repository/delete_address_reository.dart';

part 'delete_address_event.dart';
part 'delete_address_state.dart';

class DeleteAddressBloc extends Bloc<DeleteAddressEvent, DeleteAddressState> {
  final _repository = GetIt.I<DeleteAddressRepository>();
  DeleteAddressBloc() : super(DeleteAddressState()) {
    on<PerformDeleteAddressEvent>(_perform);
  }
  void _perform(PerformDeleteAddressEvent event, Emitter<DeleteAddressState> emit) async {
    emit(DeleteAddressState(isLoading: true));
    final response = await _repository.deleteaddress(event.id);
    print('REPONSE_STATUS ${response.status}');
    if (response.status == ApiStatus.success) {
      print('REPONSE_STATUS ${response.status}');


      emit(DeleteAddressState(
          isCompleted: true,
          isLoading: false,
          model: response.data

      ));
    } else {
      emit(DeleteAddressState(
        error: response.error,
        responseMsg: response.errorMsg,
        isFailed: true,
        isLoading: false,
        isCompleted: false,
      ));
    }


  }
}
