

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/alert_utils.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/stream_builder.dart';
import '../../../widgets/custom_account_backbutton.dart';
import '../../../widgets/custom_address_textfield.dart';
import '../../../widgets/custom_bottom_button.dart';
import '../../../widgets/custom_small_containers.dart';
import '../../change_address/model/address_list_model.dart';
import 'bloc/add_address_bloc.dart';
import 'bloc/edit_address_bloc.dart';

class AddAddress extends StatefulWidget {
  Datum? addressdata;

  AddAddress({Key? key,this.addressdata}) : super(key: key);

  static Widget create( Datum? addressdata){
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddAddressBloc>(
          create: (_) => AddAddressBloc(),
        ),
        BlocProvider<EditAddressBloc>(
          create: (_) => EditAddressBloc(),
        ),
      ],
      child: AddAddress(addressdata: addressdata,),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    setdata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<EditAddressBloc, EditAddressState>(
  listener: (context, state) {
    // TODO: implement listener
    if(state.isCompleted){
      AlertUtils.showToast('Address has been updated successfully');
      Navigator.pop(context);
    }
  },
  builder: (context, state) {
    return BlocConsumer<AddAddressBloc, AddAddressState>(
  listener: (context, state) {
    // TODO: implement listener
    if(state.isCompleted){

      AlertUtils.showToast('Address has been added successfully');
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
                    hintText: 'Street name',
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
                      validation();
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
);
  },
));
  }

  void validation() async {
    if (addresscontroller.text.isEmpty) {
      AlertUtils.showToast('Please enter Street name ');
    }
    else if (housenocontroller.text.isEmpty) {
      AlertUtils.showToast('Please enter house number');
    }
    else if (statecontroller.text.isEmpty) {
      AlertUtils.showToast('Please enter state name');
    }
    else if (citycontroller.text.isEmpty) {
      AlertUtils.showToast('PLease enter state name');
    }
    else if (zipcodecontroller.text.isEmpty) {
      AlertUtils.showToast('PLease enter state zipcode');
    }
    else if (addresstype.isEmpty) {
      AlertUtils.showToast('PLease enter address type');
    }
    else{
      if(StreamUtil.addresscondition.value == 0){
        bool isInternet = await AppUtils.checkInternet();
        if (isInternet) {
          var data = {
            "address": addresscontroller.text,
            "houseno": housenocontroller.text,
            "state": statecontroller.text,
            "city": citycontroller.text,
            "Zipcode": zipcodecontroller.text,
            "addresstype": addresstype,
          };

          BlocProvider.of<AddAddressBloc>(context).add(
            PerformAddAddressEvent(data: data),
          );
        }  else {
          AlertUtils.showNotInternetDialogue(context);
        }
      }
      else{
        bool isInternet = await AppUtils.checkInternet();
        if (isInternet) {
          var data = {
            "address": addresscontroller.text,
            "houseno": housenocontroller.text,
            "state": statecontroller.text,
            "city": citycontroller.text,
            "Zipcode": zipcodecontroller.text,
            "addresstype": addresstype,
          };

          BlocProvider.of<EditAddressBloc>(context).add(
            PerformEditAddressEvent(data: data),
          );
        } else {
          AlertUtils.showNotInternetDialogue(context);
        }
      }

    }
  }


  void setdata() {
    if(StreamUtil.addresscondition.value == 1){
      addresscontroller.text = widget.addressdata!.address!;
      housenocontroller.text = widget.addressdata!.houseno!.toString();
      statecontroller.text = widget.addressdata!.state!;
      citycontroller.text = widget.addressdata!.city!;
      zipcodecontroller.text = widget.addressdata!.zipcode!.toString();
      if(widget.addressdata!.addresstype == 'Home'){
        isHomeSelected = true;
        isWorkSelected = false;
        isOtherSelected = false;
      }
      else  if(widget.addressdata!.addresstype == 'Work'){
        isWorkSelected = true;
        isHomeSelected = false;
        isOtherSelected = false;
      }
      else  {
        isOtherSelected = true;
        isWorkSelected = false;
        isHomeSelected = false;
      }

    }
  }

}
