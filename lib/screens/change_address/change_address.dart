import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfive/widgets/loading_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_screens/app_screens.dart';
import '../../constants/asset_path.dart';
import '../../utils/alert_utils.dart';
import '../../utils/app_styles.dart';
import '../../utils/app_utils.dart';
import '../../utils/stream_builder.dart';
import '../../widgets/custom_account_backbutton.dart';
import '../../widgets/custom_address_container.dart';

import '../../widgets/custom_bottom_button.dart';
import '../../widgets/custom_change_address_container.dart';
import '../Account_screens/addAddress/bloc/edit_address_bloc.dart';
import 'bloc/change_address_bloc.dart';
import 'bloc/delete_address_bloc.dart';
import 'model/address_list_model.dart';

class ChangeAddress extends StatefulWidget {
  const ChangeAddress({Key? key}) : super(key: key);

  static Widget create() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChangeAddressBloc>(
          create: (_) => ChangeAddressBloc(),
        ),
        BlocProvider<DeleteAddressBloc>(
          create: (_) => DeleteAddressBloc(),
        ),

      ],
      child: ChangeAddress(),
    );
  }

  @override
  State<ChangeAddress> createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> {
  AddressListModel? addressdata;

  @override
  void initState() {
    // TODO: implement initState
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocConsumer<DeleteAddressBloc, DeleteAddressState>(
  listener: (context, state) {
    // TODO: implement listener
    if(state.isCompleted){
      AlertUtils.showToast('address has been deleted');
    }
  },
  builder: (context, state) {
    return BlocConsumer<ChangeAddressBloc, ChangeAddressState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state.isCompleted){
          addressdata = state.model!;
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Stack(
              children: [
                addressdata == null ? LoadingContainer()  :
                 SingleChildScrollView(

                    child: Container(
                      //height: 809.8.h,
                        width: 390.w,
                        color: AppStyles.black,
                        child: Column(children: [
                          Padding(padding: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomAccountBackbutton(),
                                  Text('Change Address',
                                    style: AppStyles.profilestyle,),
                                  InkWell(
                                    onTap: () {
                                      StreamUtil.addresscondition.add(0);
                                      Navigator.pushNamed(
                                          context, AppScreens.addAddress, arguments:{'addressdata':null});
                                    },
                                    child: Row(children: [
                                      SvgPicture.asset(
                                          ImageAssetPath.addIcon, height: 16.67.h,
                                          width: 16.67.w),
                                      SizedBox(width: 6.67.h),
                                      Text('Add',
                                          style: AppStyles.buttonstyle.copyWith(
                                              fontWeight: FontWeight.w400)),
                                    ],),
                                  )
                                ],)
                          ),
                          Container(
                              padding: EdgeInsets.all(20),

                                width: 390.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15),
                                  ),
                                  border: Border.all(color: AppStyles.white),
                                  color: AppStyles.white
                              ),
                              child:   ListView.builder(
                                shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: addressdata!.data!.length,
                                  itemBuilder: (context, index){
                                return  Padding(padding: EdgeInsets.only(bottom: 10),
                                  child: InkWell(
                                    onTap: (){
                                      if(StreamUtil.addressbuttoncondition.value == 1){
                                      }
                                      else {
                                        for(int j = 0; j<addressdata!.data!.length; j++){
                                          if(j == index){
                                            setState(() {
                                              addressdata!.data![j].select = true;
                                              StreamUtil.selectedAddress.add(addressdata!.data![j]);
                                            });
                                          }else{
                                            setState(() {
                                              addressdata!.data![j].select = false;
                                            });
                                          }
                                        }
                                      }
                                    },
                                    child: CustomChangeAddressContainer(
                                      address: '${addressdata!.data![index].houseno}, ${addressdata!.data![index].address}, ${addressdata!.data![index].city}\n ${addressdata!.data![index].zipcode}',
                                      text: ' ${addressdata!.data![index].addresstype}',
                                      tickimage: '${ImageAssetPath.tickIcon}',
                                      isSelected: addressdata!.data![index].select!,
                                      onEdit: (){
                                        if(StreamUtil.addressbuttoncondition.value == 1){
                                          StreamUtil.addresscondition.add(1);
                                          StreamUtil.addressid.add(addressdata!.data![index].id!.toString());
                                          Navigator.pushNamed(
                                              context, AppScreens.addAddress, arguments:{'addressdata':addressdata!.data![index]});
                                        }
                                      },
                                      onDelete: () async {


                                        deleteaddresspopup(context: context,  pressLogout: ()async{
                                          bool isInternet = await AppUtils.checkInternet();
                                          if(isInternet){
                                            BlocProvider.of<DeleteAddressBloc>(context).add(
                                              PerformDeleteAddressEvent(id: addressdata!.data![index].id!),
                                            );
                                            Navigator.pop(context);
                                          } else {
                                            AlertUtils.showNotInternetDialogue(context);
                                          }

                                        });

                                        /*BlocProvider.of<DeleteAddressBloc>(context).add(
                                                PerformDeleteAddressEvent(id: addressdata!.data![i].id!),
                                              );*/





                                      },

                                    ),
                                  ),);
                              }),
                          )
                        ],)
                    )
                ),
              ],

            ),
          bottomNavigationBar:

          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomBottomButton(
              onPress: () {
                Navigator.pop(context);
              },
              text: 'ADD'),
          ),
        );
      },
    );
  },
),);
  }

  void apicall() async {
    bool isInternet = await AppUtils.checkInternet();
    if (isInternet) {
      BlocProvider.of<ChangeAddressBloc>(context).add(
        PerformChangeAddressEvent(),
      );
    } else {
      AlertUtils.showNotInternetDialogue(context);
    }
  }

  static void deleteaddresspopup({
    BuildContext? context,
    Function? pressLogout,
    Function? pressCancle,
    String? title,
    String? message,
    String? btn1,
    String? btn2,
    String? addressid,
  }) {
    showGeneralDialog(
      barrierLabel: "Label2",
      barrierDismissible: false,
      barrierColor: Colors.black45.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      context: context!,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 265.h,
            child: SizedBox.expand(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.sp),
                    topRight: Radius.circular(10.sp)),
                child: Scaffold(
                    body:Container(
                      height: 265.h ,
                      width: 390.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          color: AppStyles.white),
                      child: Padding(padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 15),
                          child: Column(
                            children: [
                              Text('Delete', style: AppStyles.homelogostyle.copyWith(fontSize: 20.sp),),
                              SizedBox(height: 10.h),
                              Text('Are you sure you want to delete this address?', style: AppStyles.termstyle.copyWith(fontSize: 15.sp),),
                              SizedBox(height: 40.h),
                              CustomBottomButton(
                                  onPress: (){
                                    pressLogout!();
                                  },
                                  text: 'Yes'),

                              SizedBox(height: 20),
                              TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel', style:AppStyles.verifystyle.copyWith(fontSize: 14.sp) ,)),
                              ]),
                      )
                    )
                      )

                              )


                          )
                      ),
                    );

      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    ).then((value) => {print('Dialogue dismissed')});
  }

}
