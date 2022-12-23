part of 'delete_address_bloc.dart';




@immutable
abstract class DeleteAddressEvent {
  const DeleteAddressEvent();
}


class PerformDeleteAddressEvent extends DeleteAddressEvent {
  final String id;
  const PerformDeleteAddressEvent({required this.id});
}
