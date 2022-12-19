part of 'login_bloc.dart';


@immutable
abstract class LoginEvent {
  const LoginEvent();
}


class PerformLoginEvent extends LoginEvent {

  const PerformLoginEvent();
}