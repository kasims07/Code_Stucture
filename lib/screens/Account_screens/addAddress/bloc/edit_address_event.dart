part of 'edit_address_bloc.dart';


@immutable
abstract class EditAddressEvent {
  const EditAddressEvent();
}


class PerformEditAddressEvent extends EditAddressEvent {

  final dynamic data;
  const PerformEditAddressEvent({required this.data });
}
