import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../api_models/api_error.dart';
import '../../../api_models/api_status.dart';
import '../model/feedback_model.dart';
import '../repository/feedback_repository.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final _repository = GetIt.I<FeedbackRepository>();
  FeedbackBloc() : super(FeedbackState()) {
    on<PerformFeedbackEvent>(_perform);
  }
  void _perform(PerformFeedbackEvent event, Emitter<FeedbackState> emit) async {
    emit(FeedbackState(isLoading: true));
    final response = await _repository.feedback(event.data);
    print('REPONSE_STATUS ${response.status}');
    if (response.status == ApiStatus.success) {
      print('REPONSE_STATUS ${response.status}');


      emit(FeedbackState(
          isCompleted: true,
          isLoading: false,
          model: response.data

      ));
    } else {
      emit(FeedbackState(
        error: response.error,
        responseMsg: response.errorMsg,
        isFailed: true,
        isLoading: false,
        isCompleted: false,
      ));
    }


  }
}
