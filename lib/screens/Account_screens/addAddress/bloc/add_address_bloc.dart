import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../api_models/api_error.dart';
import '../../../../api_models/api_status.dart';
import '../model/add_address_model.dart';
import '../repository/add_address_repository.dart';

part 'add_address_event.dart';
part 'add_address_state.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  final _repository = GetIt.I<AddAddressRepository>();
  AddAddressBloc() : super(AddAddressState()) {
    on<PerformAddAddressEvent>(_perform);
  }
  void _perform(PerformAddAddressEvent event, Emitter<AddAddressState> emit) async {
    emit(AddAddressState(isLoading: true));
    final response = await _repository.addaddress(event.data);
    print('REPONSE_STATUS ${response.status}');
    if (response.status == ApiStatus.success) {
      print('REPONSE_STATUS ${response.status}');


      emit(AddAddressState(
          isCompleted: true,
          isLoading: false,
          model: response.data

      ));
    } else {
      emit(AddAddressState(
        error: response.error,
        responseMsg: response.errorMsg,
        isFailed: true,
        isLoading: false,
        isCompleted: false,
      ));
    }


  }
}
