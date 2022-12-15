import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gfive/app_screens/app_screens.dart';
import 'package:gfive/constants/asset_path.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../../widgets/custom_account_backbutton.dart';
import '../../../widgets/custom_address_container.dart';
import 'bloc/manage_address_bloc.dart';


class ManageAddress extends StatelessWidget {
  const ManageAddress({Key? key}) : super(key: key);

  static Widget create(){
    return MultiBlocProvider(
      providers: [
        BlocProvider<ManageAddressBloc>(
          create: (_) => ManageAddressBloc(),
        ),
      ],
      child: ManageAddress(),
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
             Text('Manage Address', style: AppStyles.profilestyle,),
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
                child: CustomAddressContainer(
                  text: 'Home',
                  tickimage: '${ImageAssetPath.tickIcon}',
                ),),
                CustomAddressContainer(
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
