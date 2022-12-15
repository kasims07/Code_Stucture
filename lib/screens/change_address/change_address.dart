import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_screens/app_screens.dart';
import '../../constants/asset_path.dart';
import '../../utils/app_styles.dart';
import '../../widgets/custom_account_backbutton.dart';
import '../../widgets/custom_address_container.dart';

import '../../widgets/custom_change_address_container.dart';
import 'bloc/change_address_bloc.dart';

class ChangeAddress extends StatelessWidget {
  const ChangeAddress({Key? key}) : super(key: key);

  static Widget create(){
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChangeAddressBloc>(
          create: (_) => ChangeAddressBloc(),
        ),
      ],
      child: ChangeAddress(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: SingleChildScrollView(

            child:Container(
              //height: 809.8.h,
                width: 390.w,
                color: AppStyles.black,
                child: Column(children: [
                  Padding(padding: EdgeInsets.all(15),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomAccountBackbutton(),
                          Text('Change Address', style: AppStyles.profilestyle,),
                          InkWell(
                            onTap: (){
                                 Navigator.pushNamed(context, AppScreens.addAddress);
                            },
                            child: Row(children: [
                              SvgPicture.asset(ImageAssetPath.addIcon, height: 16.67.h,width: 16.67.w),
                              SizedBox(width: 6.67.h),
                              Text('Add', style:AppStyles.buttonstyle.copyWith(fontWeight: FontWeight.w400)),
                            ],),
                          )
                        ],)
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 728.h,
                    width: 390.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        ),
                        color: AppStyles.white
                    ),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(bottom: 10),
                          child: CustomChangeAddressContainer(
                            text: 'Home',
                            tickimage: '${ImageAssetPath.tickIcon}',
                          ),),
                        CustomChangeAddressContainer(
                          text: 'Work',
                          tickimage: '${ImageAssetPath.greyTick}',
                        ),
                      ],
                    ),
                  )
                ],)
            )
        )
    ),);
  }
}
