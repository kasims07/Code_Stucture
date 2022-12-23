part of 'add_address_bloc.dart';




@immutable
abstract class AddAddressEvent {
  const AddAddressEvent();
}


class PerformAddAddressEvent extends AddAddressEvent {
  final dynamic data;
  const PerformAddAddressEvent({  required this.data,}

      );
}
