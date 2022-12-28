import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../api_models/api_error.dart';
import '../../../../api_models/api_status.dart';
import '../model/image_upload_model.dart';
import '../repository/upload_image_repository.dart';

part 'upload_image_event.dart';
part 'upload_image_state.dart';

class UploadImageBloc extends Bloc<UploadImageEvent, UploadImageState> {

  final _repository = GetIt.I<UploadImageRepository>();
  UploadImageBloc() : super(UploadImageState()) {
    on<PerformUploadImageEvent>(_perform);
  }
  void _perform(PerformUploadImageEvent event, Emitter<UploadImageState> emit) async {
    emit(UploadImageState(isLoading: true));
    final response = await _repository.uploadImage(event.data);
    print('REPONSE_STATUS ${response.status}');
    if (response.status == ApiStatus.success) {
      print('REPONSE_STATUS ${response.status}');
      emit(UploadImageState(
          isCompleted: true,
          isLoading: false,
          responseMsg: response.data!.message,
          model: response.data
      ));
    } else {
      emit(UploadImageState(
        error: response.error,
        responseMsg: response.errorMsg,
        isFailed: true,
        isLoading: false,
        isCompleted: false,
      ));
    }


  }
}
