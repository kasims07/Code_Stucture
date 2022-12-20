part of 'dashboard_bloc.dart';




@immutable
class DashboardState {
  final bool isLoading;
  final bool isCompleted;
  final bool isFailed;
  final ApiError? error;
  final String? responseMsg;
  final AllCategoriesModel? model;


  DashboardState({
    this.isLoading = false,
    this.error,
    this.responseMsg,
    this.isCompleted = false,
    this.isFailed = false,
    this.model
  });
}