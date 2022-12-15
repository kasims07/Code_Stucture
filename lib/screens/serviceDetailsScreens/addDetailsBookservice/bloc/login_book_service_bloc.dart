import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_book_service_event.dart';
part 'login_book_service_state.dart';

class LoginBookServiceBloc extends Bloc<LoginBookServiceEvent, LoginBookServiceState> {
  LoginBookServiceBloc() : super(LoginBookServiceInitial()) {
    on<LoginBookServiceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
