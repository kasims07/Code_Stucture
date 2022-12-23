

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/alert_utils.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/app_utils.dart';
import '../../../widgets/custom_account_backbutton.dart';
import '../../../widgets/custom_address_textfield.dart';
import '../../../widgets/custom_bottom_button.dart';
import '../../../widgets/custom_small_containers.dart';
import 'bloc/add_address_bloc.dart';

class AddAddress extends StatefulWidget {

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
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  TextEditingController addresscontroller = TextEditingController();

  TextEditingController housenocontroller = TextEditingController();

  TextEditingController statecontroller = TextEditingController();

  TextEditingController citycontroller = TextEditingController();

  TextEditingController zipcodecontroller = TextEditingController();

  bool isHomeSelected = true;

  bool isWorkSelected = false;

  bool isOtherSelected = false;

  String addresstype = 'Home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AddAddressBloc, AddAddressState>(
  listener: (context, state) {
    // TODO: implement listener
    if(state.isCompleted){
      print('========is working ===========');
      AlertUtils.showToast('Address added successfully');
      Navigator.pop(context);
    }
  },
  builder: (context, state) {
    return Scaffold(
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
                        InkWell(
                          onTap: (){
                          setState(() {
                            isHomeSelected = true;
                            isWorkSelected = false;
                            isOtherSelected = false;
                            addresstype = 'Home';
                          });
                  },
                          child: CustomSmallContainer(

                            isSelected: isHomeSelected,
                            text: 'Home',
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              isHomeSelected = false;
                              isWorkSelected = true;
                              isOtherSelected = false;
                              addresstype = 'Work';
                            });
                          },
                          child: CustomSmallContainer(
                            isSelected: isWorkSelected,
                            text: 'Work',
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              isHomeSelected = false;
                              isWorkSelected = false;
                              isOtherSelected = true;
                              addresstype = 'Other';
                            });
                          },
                          child: CustomSmallContainer(
                            isSelected: isOtherSelected,
                            text: 'Other',
                            ),
                        ),
                              ],)
                    ],),
                  ),
                  SizedBox(height: 82.h),
                  CustomBottomButton(
                    onPress: () async {
                      bool isInternet = await AppUtils.checkInternet();
                      if (isInternet) {
                        var data = {
                          "address": addresscontroller.text,
                          "houseno" : housenocontroller.text,
                          "state" : statecontroller.text,
                          "city"  : citycontroller.text,
                          "Zipcode" : zipcodecontroller.text,
                          "addresstype" : addresstype,
                        };

                        BlocProvider.of<AddAddressBloc>(context).add(
                          PerformAddAddressEvent(data: data),
                        );

                      } else {
                        AlertUtils.showNotInternetDialogue(context);
                      }

                    },
                    text:'ADD' ,
                  ),
                ],
              ),
          )
    ]
      ),
    ),
        ));
  },
));
  }
}
