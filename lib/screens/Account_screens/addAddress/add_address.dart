

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_styles.dart';
import '../../../widgets/custom_account_backbutton.dart';
import '../../../widgets/custom_address_textfield.dart';
import '../../../widgets/custom_bottom_button.dart';
import '../../../widgets/custom_small_containers.dart';
import 'bloc/add_address_bloc.dart';

class AddAddress extends StatelessWidget {
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController housenocontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController zipcodecontroller = TextEditingController();
  bool isHomeSelected = false;
  bool isWorkSelected = false;
  bool isOtherSelected = false;
  AddAddress({Key? key}) : super(key: key);

  static Widget create(){
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddAddressBloc>(
          create: (_) => AddAddressBloc(),
        ),
      ],
      child: AddAddress(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
                     topLeft: Radius.circular(15)
                   ),
                  color: AppStyles.white,
              ),
              child: Column(
                children: [
                  CustomAddressTextfield(
                    controller:addresscontroller ,
                    type: TextInputType.streetAddress,
                    hintText: 'Address',
                    labelText: 'Address',
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
                   // maxline: 5,
                    hintText: 'State',
                    labelText: 'State',
                  ),
                  SizedBox(height: 15),
                  CustomAddressTextfield(
                    controller:citycontroller ,
                    type: TextInputType.text,
                    hintText: 'City',
                    labelText: 'City',
                  ),
                  SizedBox(height: 15),
                  CustomAddressTextfield(
                    controller:zipcodecontroller ,
                    type: TextInputType.text,
                    hintText: 'Zip Code/Postal Code',
                    labelText: 'Zip Code/Postal Code',
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    height:123.h ,
                  //width: 350.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppStyles.backgroundcolor
                    ),
                    child: Column(children: [
                      SizedBox(height: 22.h),
                      Text('Address Type',style: AppStyles.homelogostyle.copyWith(fontWeight: FontWeight.w500),),
                      SizedBox(height: 15.h),
                      Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children: [
                        CustomSmallContainer(
                          selectedbool: isHomeSelected,
                          text: 'Home',
                        ),
                        CustomSmallContainer(
                          selectedbool: isWorkSelected,
                          text: 'Work',
                        ),
                        CustomSmallContainer(
                          selectedbool: isOtherSelected,
                          text: 'Other',
                          ),
                              ],)
                    ],),
                  ),
                  SizedBox(height: 82.h),
                  CustomBottomButton(
                    onPress: null,
                    text:'ADD' ,
                  ),
                ],
              ),
          )
    ]
      ),
    ),
        )));
  }
}
