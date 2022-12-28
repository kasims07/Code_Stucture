part of 'upload_image_bloc.dart';

@immutable
abstract class UploadImageEvent {
  const UploadImageEvent();
}

class PerformUploadImageEvent extends UploadImageEvent {
  final dynamic data;


  const PerformUploadImageEvent({
    required this.data,
  });
}