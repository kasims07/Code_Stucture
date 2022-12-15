import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'terms_and_conditions_event.dart';
part 'terms_and_conditions_state.dart';

class TermsAndConditionsBloc extends Bloc<TermsAndConditionsEvent, TermsAndConditionsState> {
  TermsAndConditionsBloc() : super(TermsAndConditionsInitial()) {
    on<TermsAndConditionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
