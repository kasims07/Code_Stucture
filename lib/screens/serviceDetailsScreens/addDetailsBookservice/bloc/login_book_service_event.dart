part of 'login_book_service_bloc.dart';


@immutable
abstract class LoginBookServiceEvent {
  const LoginBookServiceEvent();
}


class PerformLoginBookServiceEvent extends LoginBookServiceEvent {

  final dynamic data;

  const PerformLoginBookServiceEvent({  required this.data,}

      );
}
