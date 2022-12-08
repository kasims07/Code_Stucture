import 'package:json_annotation/json_annotation.dart';

import 'error_dto.dart';

part 'api_error.g.dart';

@JsonSerializable()
class ApiError {
  final ErrorDto? errors;

  ApiError({this.errors});

  factory ApiError.fromMessage(String message) {
    return ApiError(errors: ErrorDto(message: message));
  }

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);

  String? getFirstError() {
    /*final message = getFirstErrorFromList(errors!.error!);
    if (message != null) return message;*/
    final error = errors?.message;
    if (error != null) return error;

    return null;
  }

  String? getFirstErrorFromList(String error) {
    if (error == null || error.isEmpty) return null;
    return error;
  }
}
