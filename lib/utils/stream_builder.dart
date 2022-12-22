import 'package:rxdart/rxdart.dart';

class StreamUtil{

  static BehaviorSubject<String> countrycode = BehaviorSubject<String>.seeded('91');
  static BehaviorSubject<int> bottombar = BehaviorSubject<int>.seeded(0);
  static BehaviorSubject<String> verificationIDSubject = BehaviorSubject<String>();
  static BehaviorSubject<String> categoryid = BehaviorSubject<String>();
  static BehaviorSubject<String> subserviceid = BehaviorSubject<String>();
  static BehaviorSubject<String> includesid = BehaviorSubject<String>();
  static BehaviorSubject<String> prizeid = BehaviorSubject<String>();
  static BehaviorSubject<String> categoryname = BehaviorSubject<String>();
  static BehaviorSubject<String> subservicename = BehaviorSubject<String>();
  static BehaviorSubject<String> prizetitle = BehaviorSubject<String>();
  static BehaviorSubject<int> prizetag = BehaviorSubject<int>();
  static BehaviorSubject<String> username = BehaviorSubject<String>();
  static BehaviorSubject<String> mobilenumber = BehaviorSubject<String>();
  static BehaviorSubject<String> email = BehaviorSubject<String>();

}