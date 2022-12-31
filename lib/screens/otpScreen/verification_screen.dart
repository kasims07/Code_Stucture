import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/app_screens/app_screens.dart';
import 'package:gfive/constants/app_constants.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/asset_path.dart';
import '../../utils/alert_utils.dart';
import '../../utils/app_styles.dart';
import '../../utils/app_utils.dart';
import '../../utils/stream_builder.dart';
import '../../widgets/button_loader.dart';
import '../../widgets/custom_otp_button.dart';
import '../../widgets/loading_container.dart';
import '../login_screens/bloc/login_otp_bloc.dart';
import 'bloc/login_bloc.dart';
import 'bloc/otp_verification_bloc.dart';

class VerificationScreen extends StatefulWidget {
  final String? mobileNum;
  VerificationScreen({Key? key, required this.mobileNum}) : super(key: key);

  static Widget create(String? mobileNum) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginOtpBloc>(
          create: (_) => LoginOtpBloc(),
        ),
        BlocProvider<OtpVerificationBloc>(
          create: (_) => OtpVerificationBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(),
        ),
      ],
      child: VerificationScreen(
        mobileNum: mobileNum,
      ),
    );
  }

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  OtpFieldController otpController = OtpFieldController();

  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isPhoneVerify = false;

  String otpPhone = '';
  bool ischeck = false;

  List<String> codes = [];

  Timer? _timer;
  int _start = 25;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendOTP();
    startTimer();
    StreamUtil.otpcode.add('');
    StreamUtil.otpcode.listen((value) {
      if(StreamUtil.otpcode.value != ''){
        print('Code in UI ===> ${StreamUtil.otpcode.value} ');
        codes = StreamUtil.otpcode.value.split('');
        print('code list ===> ${codes.toString()}');
        otpController.set(codes);
        ischeck = true;
      }
    });
  }

  void sendOTP() async {
    bool isInternet = await AppUtils.checkInternet();
    if(isInternet){
      BlocProvider.of<LoginOtpBloc>(context).add(
        PerformLoginOtpEvent(phone: widget.mobileNum),
      );
    }else {
      AlertUtils.showNotInternetDialogue(context);
    }
  }


  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
    otpController.clear();
  }

  @override
  Widget build(BuildContext context) {




    return SafeArea(
        child: Scaffold(
            body: BlocConsumer<LoginBloc, LoginState>(
  listener: (context, state) async {
    // TODO: implement listener
    if(state.isCompleted){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //prefs.clear();
      prefs.setString(AppConstants.TOKEN, state.model!.token!);
      prefs.setBool(AppConstants.login, true);
      StreamUtil.bottombar.add(0);
      StreamUtil.otpcode.add('');
      if(state.model!.isExist == true){
        Navigator.pushNamed(context, AppScreens.dashboardScreen);
      }
      else{
        Navigator.pushNamed(context, AppScreens.profileScreen);
      }

    }

  },
  builder: (context, state) {
    return state.isLoading ? LoadingContainer() : SingleChildScrollView(
      child: Stack(children: [
        SizedBox(
            //height: MediaQuery.of(context).size.height,
          height: 844.h,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              ImageAssetPath.loginScreen,
              fit: BoxFit.fill,
            )),
        Positioned(
          top:  310.h,
          right: 0.w,
          left: 0.w,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                //height: 384.h,
                  width: 349.w,

                  // alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppStyles.white),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('OTP Verification', style: AppStyles.verifystyle),
                            SizedBox(height: 15),
                            Text(
                                'We have sent one-time\npasscode to your mobile number \n +${StreamUtil.countrycode.value} ${widget.mobileNum}',
                                textAlign: TextAlign.center,
                                style:
                                    AppStyles.termstyle.copyWith(fontSize: 16.sp)),
                            SizedBox(height: 27.h),
                            Container(
                              width: 349.w,
                              decoration: BoxDecoration(
                                color: AppStyles.lightgrey.withOpacity(0.5),
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                              ),
                              child: Column(
                                  children: [
                                    SizedBox(height: 15),
                                    Form(
                                      key: formKey,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, right: 20.0),
                                            child: OTPTextField(
                                                otpFieldStyle: OtpFieldStyle(
                                                    enabledBorderColor: AppStyles.black,
                                                    borderColor: AppStyles.grey,
                                                    focusBorderColor: AppStyles.black),
                                                controller: otpController,
                                                length: 6,
                                                width: MediaQuery.of(context).size.width,
                                                textFieldAlignment:
                                                MainAxisAlignment.spaceAround,
                                                fieldWidth: 45,
                                                fieldStyle: FieldStyle.box,
                                                outlineBorderRadius: 9,
                                                style: AppStyles.verifystyle.copyWith(
                                                    color: AppStyles.black,
                                                    fontSize: 15.sp),
                                                onChanged: (pin) {
                                                  print("Changed: " + pin);
                                                },
                                                onCompleted: (pin) {
                                                  setState(() {
                                                    otpPhone = pin;
                                                  });
                                                }),
                                          ),
                                          SizedBox(
                                            height: 1.5.h,
                                          )
                                        ],
                                      ),
                                    ),

                                SizedBox(height: 25),
                                    Column(
                                      children: [
                                        Text('Didnot recieve code?',
                                            style: AppStyles.termstyle
                                                .copyWith(fontSize: 15.sp)),
                                        _start != 0
                                            ? InkWell(
                                          child: Text(
                                            'Resend Code in ${_start}s',
                                            textAlign: TextAlign.center,
                                            style: AppStyles.verifystyle
                                                .copyWith(fontSize: 15.sp),
                                          ),
                                        ) : InkWell(
                                          onTap: (){
                                            sendOTP();
                                            setState(() {
                                              _start = 25;
                                              startTimer();
                                            });
                                          },
                                          child: Text(' Resend',
                                            style: AppStyles.verifystyle
                                                .copyWith(fontSize: 15.sp)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    isLoading ? ButtonLoaderWidget() : CustomOtpButton(
                                  text: 'VERIFY',
                                  onPress: () async {
                                    if(otpPhone.toString().isNotEmpty){
                                      bool isInternet = await AppUtils.checkInternet();
                                      if(isInternet){
                                        verifyMobileOTP();
                                      }else {
                                        AlertUtils.showNotInternetDialogue(context);
                                      }
                                    }else {
                                      AlertUtils.showToast(
                                          'Please enter OTP');
                                    }
                                  },
                                )
                              ]),
                            )
                          ]))),
            ),
            Padding(
                padding:
                    EdgeInsets.only(top: 41, right: 68, left: 69, bottom: 20),
                child: Column(
                  children: [
                    Text('By creating account you agree to our', style:AppStyles.termstyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Terms of Service', style: AppStyles.verifystyle.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400, decoration: TextDecoration.underline),),
                        Text(' and ', style:AppStyles.termstyle ),
                        Text('Privacy Policy', style: AppStyles.verifystyle.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400, decoration: TextDecoration.underline),),
                      ],)
                  ],
                )
            )
          ]),
        )
      ]),
    );
  },
)));
  }


  Future verifyMobileOTP() async {
    setState(() {
      isLoading = true;
    });
    FirebaseAuth auth = FirebaseAuth.instance;
    print('TOKENSSS ${StreamUtil.verificationIDSubject.value}');
   /* BlocProvider.of<VerifyOtpBloc>(context).add(
      PerformVerifyOtpEvent(
          verificationId: StreamUtil.verificationIDSubject.value, otp: otp),
    );
*/
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: StreamUtil.verificationIDSubject.value,
          smsCode: otpPhone);


      await auth.signInWithCredential(credential).then((value) async {
        print("You are logged in successfully");
        String token = await value.user!.getIdToken(true);
        setState(() {
          isLoading = false;
          isPhoneVerify = true;
        });
        checkUser();
        //verifyEmailOTP();

      });

    } on FirebaseException catch (e) {
      print('SEND_OTP ${e.toString()}');
      setState(() {
        isLoading = false;
      });
      AlertUtils.showManuallyCloseDialogue(
          context,
          'The mobile otp is invalid.',
          3,
          'Oops!');
    }

  }

  void checkUser() async {
    bool isInternet = await AppUtils.checkInternet();
    if (isInternet) {
      BlocProvider.of<LoginBloc>(context).add(
        PerformLoginEvent(),
      );
    } else {
      AlertUtils.showNotInternetDialogue(context);
    }
  }


}
