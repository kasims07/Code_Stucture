

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../api_client/dio_client.dart';
import '../app_preferences/preference_manager.dart';
import '../screens/dashBoard/repository/dashboard_repository.dart';
import '../screens/dashBoard/repository/dashboard_repository_impl.dart';
import '../screens/otpScreen/repository/login_repository.dart';
import '../screens/otpScreen/repository/login_repository_impl.dart';
import '../screens/profileScreen/repository/profile_repository.dart';
import '../screens/profileScreen/repository/profile_repository_impl.dart';

final GetIt _getIt = GetIt.instance;


void setupDependencies(){
  // Logger
  _getIt.registerSingleton<Logger>(Logger());
  // DIO HTTP Client
  _getIt.registerSingleton<Dio>(DioClient().getDio());
  // Preference Manager
  _getIt.registerSingleton<PreferencesManager>(PreferencesManager());

  //login user
  _getIt.registerSingleton<LoginRepository>(LoginImpl());

  //update user
  _getIt.registerSingleton<ProfileRepository>(ProfileImpl());

  //dashboard
  _getIt.registerSingleton<DashboardRepository>(DashboardImpl());

}