part of 'subservice_details_bloc.dart';




@immutable
class SubserviceDetailsState {
  final bool isLoading;
  final bool isCompleted;
  final bool isFailed;
  final ApiError? error;
  final String? responseMsg;
  final SubserviceModel? model;


  SubserviceDetailsState({
    this.isLoading = false,
    this.error,
    this.responseMsg,
    this.isCompleted = false,
    this.isFailed = false,
    this.model
  });
}
