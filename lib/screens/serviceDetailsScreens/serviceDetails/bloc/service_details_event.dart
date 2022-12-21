part of 'service_details_bloc.dart';




@immutable
abstract class ServiceDetailsEvent {
  const ServiceDetailsEvent();
}


class PerformServiceDetailsEvent extends ServiceDetailsEvent {
    final String id;
  const PerformServiceDetailsEvent({required this.id});
}