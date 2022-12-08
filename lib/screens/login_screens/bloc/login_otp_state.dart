part of 'login_otp_bloc.dart';

@immutable
class LoginOtpState {
  final bool isLoading;
  final String? error;
  final bool isCompleted;
  final bool isFailed;
  final String? verificationId;

  LoginOtpState({
    this.isLoading = false,
    this.error,
    this.isCompleted = false,
    this.isFailed = false,
    this.verificationId,
  });
}