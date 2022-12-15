import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'contact_uc_event.dart';
part 'contact_uc_state.dart';

class ContactUcBloc extends Bloc<ContactUcEvent, ContactUcState> {
  ContactUcBloc() : super(ContactUcInitial()) {
    on<ContactUcEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
