part of 'service_details_bloc.dart';




@immutable
class ServiceDetailsState {
  final bool isLoading;
  final bool isCompleted;
  final bool isFailed;
  final ApiError? error;
  final String? responseMsg;
  final CategoryModel? model;


  ServiceDetailsState({
    this.isLoading = false,
    this.error,
    this.responseMsg,
    this.isCompleted = false,
    this.isFailed = false,
    this.model
  });
}
