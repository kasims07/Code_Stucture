import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../api_models/api_error.dart';
import '../../../../api_models/api_status.dart';
import '../model/category_model.dart';
import '../repository/category_repository.dart';

part 'service_details_event.dart';
part 'service_details_state.dart';

class ServiceDetailsBloc extends Bloc<ServiceDetailsEvent, ServiceDetailsState> {
  final _repository = GetIt.I<CategoryRepository>();
  ServiceDetailsBloc() : super(ServiceDetailsState()) {
    on<PerformServiceDetailsEvent>(_perform);
  }
  void _perform(PerformServiceDetailsEvent event, Emitter<ServiceDetailsState> emit) async {
    emit(ServiceDetailsState(isLoading: true));
    final response = await _repository.category(event.id);
    print('REPONSE_STATUS ${response.status}');
    if (response.status == ApiStatus.success) {
      print('REPONSE_STATUS ${response.status}');


      emit(ServiceDetailsState(
          isCompleted: true,
          isLoading: false,
          model: response.data

      ));
    } else {
      emit(ServiceDetailsState(
        error: response.error,
        responseMsg: response.errorMsg,
        isFailed: true,
        isLoading: false,
        isCompleted: false,
      ));
    }


  }
}
