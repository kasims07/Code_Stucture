import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'privacy_policy_event.dart';
part 'privacy_policy_state.dart';

class PrivacyPolicyBloc extends Bloc<PrivacyPolicyEvent, PrivacyPolicyState> {
  PrivacyPolicyBloc() : super(PrivacyPolicyInitial()) {
    on<PrivacyPolicyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
