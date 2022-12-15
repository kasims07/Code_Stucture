import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'subservice_details_event.dart';
part 'subservice_details_state.dart';

class SubserviceDetailsBloc extends Bloc<SubserviceDetailsEvent, SubserviceDetailsState> {
  SubserviceDetailsBloc() : super(SubserviceDetailsInitial()) {
    on<SubserviceDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
