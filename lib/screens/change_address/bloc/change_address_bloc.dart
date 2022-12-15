import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_address_event.dart';
part 'change_address_state.dart';

class ChangeAddressBloc extends Bloc<ChangeAddressEvent, ChangeAddressState> {
  ChangeAddressBloc() : super(ChangeAddressInitial()) {
    on<ChangeAddressEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
