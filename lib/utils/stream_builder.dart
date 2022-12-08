import 'package:rxdart/rxdart.dart';

class StreamUtil{
  static BehaviorSubject<String> countrycode =
  BehaviorSubject<String>.seeded('91');
  static BehaviorSubject<int> bottombar =
  BehaviorSubject<int>.seeded(0);
}