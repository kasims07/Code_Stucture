part of 'feedback_bloc.dart';



@immutable
class FeedbackState {
  final bool isLoading;
  final bool isCompleted;
  final bool isFailed;
  final ApiError? error;
  final String? responseMsg;
  final FeedbackModel? model;


  FeedbackState({
    this.isLoading = false,
    this.error,
    this.responseMsg,
    this.isCompleted = false,
    this.isFailed = false,
    this.model
  });
}