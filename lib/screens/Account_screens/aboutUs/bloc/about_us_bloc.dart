import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'about_us_event.dart';
part 'about_us_state.dart';

class AboutUsBloc extends Bloc<AboutUsEvent, AboutUsState> {
  AboutUsBloc() : super(AboutUsInitial()) {
    on<AboutUsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
