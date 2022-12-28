

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../api_client/dio_client.dart';
import '../app_preferences/preference_manager.dart';
import '../screens/Account_screens/addAddress/repository/add_address_repository.dart';
import '../screens/Account_screens/addAddress/repository/add_address_repository_impl.dart';
import '../screens/Account_screens/addAddress/repository/edit_address_repository.dart';
import '../screens/Account_screens/addAddress/repository/edit_address_repository_impl.dart';
import '../screens/Account_screens/editProfile/repository/editprofile_repository.dart';
import '../screens/Account_screens/editProfile/repository/editprofile_repository_impl.dart';
import '../screens/Account_screens/editProfile/repository/upload_image_impl.dart';
import '../screens/Account_screens/editProfile/repository/upload_image_repository.dart';
import '../screens/change_address/repository/change_address_repository.dart';
import '../screens/change_address/repository/change_address_repository_impl.dart';
import '../screens/change_address/repository/delete_address_reository.dart';
import '../screens/change_address/repository/delete_address_repository_impl.dart';
import '../screens/dashBoard/repository/dashboard_repository.dart';
import '../screens/dashBoard/repository/dashboard_repository_impl.dart';
import '../screens/myBookingScreens/repository/booking_history_repository.dart';
import '../screens/myBookingScreens/repository/booking_history_repository_impl.dart';
import '../screens/otpScreen/repository/login_repository.dart';
import '../screens/otpScreen/repository/login_repository_impl.dart';
import '../screens/profileScreen/repository/profile_repository.dart';
import '../screens/profileScreen/repository/profile_repository_impl.dart';
import '../screens/serviceDetailsScreens/addDetailsBookservice/repository/lbservice_repository.dart';
import '../screens/serviceDetailsScreens/addDetailsBookservice/repository/lbservice_repository_impl.dart';
import '../screens/serviceDetailsScreens/serviceDetails/repository/category_repository.dart';
import '../screens/serviceDetailsScreens/serviceDetails/repository/category_repository_impl.dart';
import '../screens/serviceDetailsScreens/subserviceDetails/repository/subservice_repository.dart';
import '../screens/serviceDetailsScreens/subserviceDetails/repository/subservice_repository_impl.dart';

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

  //category
  _getIt.registerSingleton<CategoryRepository>(CategoryImpl());

  //subservice
  _getIt.registerSingleton<SubserviceRepository>(SubserviceImpl());

  //loginbookservice
  _getIt.registerSingleton<LbserviceRepository>(LbserviceImpl());

  //editprofile update
  _getIt.registerSingleton<EditProfileRepository>(EditProfileImpl());

  //addaddress
  _getIt.registerSingleton<AddAddressRepository>(AddAddressImpl());

  //addresslist
  _getIt.registerSingleton<ChangeAddressRepository>(ChangeAddressImpl());

  //deleteaddress
  _getIt.registerSingleton<DeleteAddressRepository>(DeleteAddressImpl());

  //editaddress
  _getIt.registerSingleton<EditAddressRepository>(EditAddressImpl());

  //bookinghistory
  _getIt.registerSingleton<BookingHistoryRepository>(BookingHistoryImpl());

  //uploadimage
  _getIt.registerSingleton<UploadImageRepository>(UploadImageImpl());
}