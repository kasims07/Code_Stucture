

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_styles.dart';
import '../../widgets/custom_account_backbutton.dart';
import '../../widgets/custom_address_textfield.dart';

class AddAddress extends StatelessWidget {
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController housenocontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController zipcodecontroller = TextEditingController();
  AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
      //height: 809.8.h,
      width: 390.w,
      color: AppStyles.black,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Row(children:[
          CustomAccountBackbutton(),
          SizedBox(width: 95.63.w),
          Text('Add Address', style: AppStyles.profilestyle),
        ]),
        SizedBox(height: 17.h),
         Text('Enter your new address for Service in\nfuture', textAlign:TextAlign.center, style:AppStyles.termstyle.copyWith(fontSize: 15.sp)),
        SizedBox(height: 26),
        Container(
            padding: EdgeInsets.all(20),
            height: 671.h,
            width: 390.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                color: AppStyles.white
            ),
            child: Padding(padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CustomAddressTextfield(
                  controller:addresscontroller ,
                  type: TextInputType.streetAddress,
                  hintText: 'Address',
                  labelText: 'Street Address',

                ),
                SizedBox(height: 15),
                CustomAddressTextfield(
                  controller:housenocontroller ,
                  type: TextInputType.streetAddress,
                  hintText: 'House/Flat No',
                  labelText: 'House/Flat No',
                ),
                SizedBox(height: 15),
                CustomAddressTextfield(
                  controller:statecontroller ,
                  type: TextInputType.text,
                  maxline: 1,
                  hintText: 'State',
                  labelText: 'State',
                ),
                SizedBox(height: 15),
                CustomAddressTextfield(
                  controller:citycontroller ,
                  type: TextInputType.text,
                  hintText: 'City',
                  maxline: 1,
                  labelText: 'City',
                ),
                SizedBox(height: 15),
                CustomAddressTextfield(
                  controller:zipcodecontroller ,
                  type: TextInputType.text,
                  hintText: 'Zip Code/Postal Code',
                  maxline: 1,
                  maxlength: 8,
                  labelText: 'Zip Code/Postal Code',
                ),
              ],
            ),
            ),
        )
    ]
      ),
    )));
  }
}
