part of 'profile_screen_bloc.dart';



@immutable
abstract class ProfileScreenEvent {
  const ProfileScreenEvent();
}


class PerformProfileScreenEvent extends ProfileScreenEvent {

  final dynamic data;

  const PerformProfileScreenEvent({  required this.data,}

      );
}