part of 'delete_address_bloc.dart';




@immutable
class DeleteAddressState {
  final bool isLoading;
  final bool isCompleted;
  final bool isFailed;
  final ApiError? error;
  final String? responseMsg;
  final DeleteAddressModel? model;


  DeleteAddressState({
    this.isLoading = false,
    this.error,
    this.responseMsg,
    this.isCompleted = false,
    this.isFailed = false,
    this.model
  });
}