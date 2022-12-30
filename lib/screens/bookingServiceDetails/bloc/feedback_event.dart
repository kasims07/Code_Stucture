part of 'feedback_bloc.dart';




@immutable
abstract class FeedbackEvent {
  const FeedbackEvent();
}


class PerformFeedbackEvent extends FeedbackEvent {
  final dynamic data;
  const PerformFeedbackEvent({required this.data});
}