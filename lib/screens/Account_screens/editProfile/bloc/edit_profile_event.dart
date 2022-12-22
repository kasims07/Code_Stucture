part of 'edit_profile_bloc.dart';




@immutable
abstract class EditProfileEvent {
  const EditProfileEvent();
}


class PerformEditProfileEvent extends EditProfileEvent {
  final dynamic data;
  const PerformEditProfileEvent({required this.data,}

      );
}
