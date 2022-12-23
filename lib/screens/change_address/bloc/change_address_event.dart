part of 'change_address_bloc.dart';



@immutable
abstract class ChangeAddressEvent {
  const ChangeAddressEvent();
}


class PerformChangeAddressEvent extends ChangeAddressEvent {
  const PerformChangeAddressEvent();
}
