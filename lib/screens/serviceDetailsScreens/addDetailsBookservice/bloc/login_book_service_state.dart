part of 'login_book_service_bloc.dart';




@immutable
class LoginBookServiceState {
  final bool isLoading;
  final bool isCompleted;
  final bool isFailed;
  final ApiError? error;
  final String? responseMsg;
  final LbServiceModel? model;


  LoginBookServiceState({
    this.isLoading = false,
    this.error,
    this.responseMsg,
    this.isCompleted = false,
    this.isFailed = false,
    this.model
  });
}