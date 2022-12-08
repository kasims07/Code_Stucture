import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../utils/stream_builder.dart';

part 'login_otp_event.dart';
part 'login_otp_state.dart';

class LoginOtpBloc extends Bloc<LoginOtpEvent, LoginOtpState> {
  LoginOtpBloc() : super(LoginOtpState()) {
    on<PerformLoginOtpEvent>(_performOtp);
  }
  Future _performOtp(PerformLoginOtpEvent event, Emitter<LoginOtpState> emit) async {
    print('C_CODE');
    String verificationId='';
    emit(LoginOtpState(isLoading: true));


    print('C_CODE ${StreamUtil.countrycode.value}');

    await FirebaseAuth.instance.verifyPhoneNumber(
      //phoneNumber: '+91 ${event.phone}',
      phoneNumber: '+${StreamUtil.countrycode.value} ${event.phone}',
      timeout: const Duration(seconds: 60),
      verificationCompleted: (AuthCredential authCredential) {
        print('Your account is successfully verified');
      },

      codeAutoRetrievalTimeout: (String verId) {
      },
      verificationFailed: (FirebaseAuthException error) {
      },
      codeSent: await (String verificationId, int? forceResendingToken) async{
        StreamUtil.verificationIDSubject.add(verificationId);
        print('SEND_ID $verificationId');
      },);
    final user = await FirebaseAuth.instance.currentUser;
    final idToken = await user!.getIdToken();
    final token = idToken.toString();
    print('TOKEN IS ====> ${token}');

    emit(LoginOtpState(
        isCompleted: true,
        isLoading: false,
        verificationId: verificationId
    ));


  }

}
