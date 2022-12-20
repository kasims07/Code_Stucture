part of 'profile_screen_bloc.dart';



@immutable
class ProfileScreenState {
  final bool isLoading;
  final bool isCompleted;
  final bool isFailed;
  final ApiError? error;
  final String? responseMsg;
  final UpdateUserModel? model;


  ProfileScreenState({
    this.isLoading = false,
    this.error,
    this.responseMsg,
    this.isCompleted = false,
    this.isFailed = false,
    this.model
  });
}
