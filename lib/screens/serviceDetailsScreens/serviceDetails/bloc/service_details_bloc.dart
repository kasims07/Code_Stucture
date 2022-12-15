import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'service_details_event.dart';
part 'service_details_state.dart';

class ServiceDetailsBloc extends Bloc<ServiceDetailsEvent, ServiceDetailsState> {
  ServiceDetailsBloc() : super(ServiceDetailsInitial()) {
    on<ServiceDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
