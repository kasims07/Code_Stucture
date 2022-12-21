part of 'subservice_details_bloc.dart';




@immutable
abstract class SubserviceDetailsEvent {
  const SubserviceDetailsEvent();
}


class PerformSubserviceDetailsEvent extends SubserviceDetailsEvent {
  final String id;
  const PerformSubserviceDetailsEvent({required this.id});
}

