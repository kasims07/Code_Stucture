part of 'login_otp_bloc.dart';

@immutable
abstract class LoginOtpEvent {
  const LoginOtpEvent();
}

class PerformLoginOtpEvent extends LoginOtpEvent {
  String? phone;
  PerformLoginOtpEvent({required this.phone});
}