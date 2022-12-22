import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../../constants/asset_path.dart';
import '../../../utils/alert_utils.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/stream_builder.dart';
import '../../../widgets/custom_account_backbutton.dart';
import '../../../widgets/custom_bottom_button.dart';
import '../../../widgets/custom_phone_textfield.dart';
import '../../../widgets/custom_textformfield.dart';
import 'bloc/edit_profile_bloc.dart';

class EditProfileScreen extends StatefulWidget {

  EditProfileScreen({Key? key}) : super(key: key);

  static Widget create() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EditProfileBloc>(
          create: (_) => EditProfileBloc(),
        ),
      ],
      child: EditProfileScreen(),
    );
  }

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController namecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController numbercontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    namecontroller.text = StreamUtil.username.value;
    numbercontroller.text = StreamUtil.mobilenumber.value;
    emailcontroller.text = StreamUtil.email.value;


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocConsumer<EditProfileBloc, EditProfileState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state.isCompleted){
          StreamUtil.email.add(state.model!.data!.email!);
          StreamUtil.username.add(state.model!.data!.name!);
          AlertUtils.showToast('Updated user successfully');
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              //height: 844.h,
              width: 390.w,
              color: AppStyles.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  Row(children: [
                    CustomAccountBackbutton(),
                    SizedBox(width: 93.63),
                    Text('Edit Profile', textAlign: TextAlign.center,
                        style: AppStyles.profilestyle),
                  ],),
                  SizedBox(height: 24.h),
                  Container(
                      height: 721.h,
                      width: 390.w,
                      decoration: BoxDecoration(
                        color: AppStyles.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 35, right: 20, left: 20, bottom: 24),
                        child: Column(children: [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle
                                ),
                                child: Image.asset(
                                    ImageAssetPath.accountImage, height: 91.h,
                                    width: 91.w),
                              ),
                              Positioned(
                                top: 55,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle
                                  ),
                                  child: SvgPicture.asset(
                                      ImageAssetPath.cameraIcon, height: 31.h,
                                      width: 31.w),
                                ),

                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          CustomTextformfield(
                            controller: namecontroller,
                            type: TextInputType.text,
                            icon: Container(
                              padding: EdgeInsets.all(12.h),
                              child: SvgPicture.asset(
                                ImageAssetPath.profileIcon,),),
                            hintText: 'Full Name',
                            labelText: 'Full Name',

                          ),
                          SizedBox(height: 15.h),
                          CustomPhoneField(
                            controller: numbercontroller,
                            type: TextInputType.number,
                            hintText: 'Mobile Number',
                            labelText: 'Mobile Number',
                            readonly: true,


                          ),
                          SizedBox(height: 15.h),
                          CustomTextformfield(
                            controller: emailcontroller,
                            type: TextInputType.emailAddress,
                            icon: Container(
                              padding: EdgeInsets.all(12.h),
                              child: SvgPicture.asset(
                                ImageAssetPath.emailIcon,),),
                            hintText: 'Email ',
                            labelText: 'Email',
                          ),

                          SizedBox(height: 284.h),
                          CustomBottomButton(
                            onPress: () async {
                              bool isInternet = await AppUtils.checkInternet();
                              if (isInternet) {
                                var data = {
                                  "name": namecontroller.text,
                                  "email": emailcontroller.text,
                                };
                                BlocProvider.of<EditProfileBloc>(context).add(
                                  PerformEditProfileEvent(data: data),
                                );
                              } else {
                                AlertUtils.showNotInternetDialogue(context);
                              }
                            },
                            text: 'UPDATE',
                          ),

                        ],),
                      )
                  )
                ],),
            ),
          ),
        );
      },
    ));
  }
}
