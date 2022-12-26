

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfive/utils/app_routers.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../../app_screens/app_screens.dart';
import '../../../constants/asset_path.dart';
import '../../../utils/alert_utils.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/date_time_utils.dart';
import '../../../utils/stream_builder.dart';
import '../../../widgets/custom_account_backbutton.dart';
import '../../../widgets/custom_bottom_button.dart';
import '../../../widgets/custom_dialog_bottom_button.dart';
import '../../../widgets/custom_numberfield.dart';
import '../../../widgets/custom_phone_textfield.dart';
import '../../../widgets/custom_textformfield.dart';
import '../../../widgets/custom_time_container.dart';
import 'bloc/login_book_service_bloc.dart';




class LoginBookServiceScreen extends StatefulWidget {
  const LoginBookServiceScreen({Key? key}) : super(key: key);

  static Widget create() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBookServiceBloc>(
          create: (_) => LoginBookServiceBloc(),
        ),
      ],
      child: LoginBookServiceScreen(),
    );
  }

  @override
  State<LoginBookServiceScreen> createState() => _LoginBookServiceScreenState();
}

class _LoginBookServiceScreenState extends State<LoginBookServiceScreen> {

  TextEditingController namecontroller = TextEditingController();

  TextEditingController numbercontroller = TextEditingController();



  String? updateDate;
  String? dateForShown;

  List<dynamic> timelist = [
    '08:00',
    '10:00',
    '11:00',
    '12:00',
    '01:00',
    '02:00',
    '03:00'
  ];

  int selectIndex = 0;
  String selectTime =  '08:00';


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    namecontroller.text = StreamUtil.username.value;
    numbercontroller.text = StreamUtil.mobilenumber.value;
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBookServiceBloc, LoginBookServiceState>(
  listener: (context, state) {
    // TODO: implement listener
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
                  SizedBox(height: 50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomAccountBackbutton(),
                      SizedBox(width: 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(StreamUtil.categoryname.value,
                              style: AppStyles.profilestyle),
                          SizedBox(height: 15),
                          Text(StreamUtil.subservicename.value,
                              style: AppStyles.termstyle),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(StreamUtil.prizetitle.value, style: AppStyles.redstyle),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Container(
                                    height: 8.h,
                                    width: 8.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppStyles.white
                                    ),
                                  ),
                                ),
                                Text(StreamUtil.prizetag.value.toString(), style: AppStyles.buttonstyle.copyWith(
                                    fontSize: 16.sp),)
                              ]),
                        ],
                      )
                    ],
                  ),
/*Row(children: [
                    CustomAccountBackbutton(),
                    SizedBox(width: 49.62.w),
                    Text(StreamUtil.categoryname.value,
                        style: AppStyles.profilestyle)
                  ],),
                  SizedBox(height: 2.h),
                  Text('Unfurnished Apartment classic',
                      style: AppStyles.termstyle),
                  SizedBox(height: 6.h),*/
                  /*Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('1BHK', style: AppStyles.redstyle),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            height: 8.h,
                            width: 8.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppStyles.white
                            ),
                          ),
                        ),
                        Text('₹ 2099', style: AppStyles.buttonstyle.copyWith(
                            fontSize: 16.sp),)
                      ]),*/

                  SizedBox(height: 15.h),
                  Container(
                      //height: 691.h,
                      width: 390.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)
                          ),
                          color: AppStyles.white
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(top: 21, right: 20, bottom: 15, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Contact Info', style: AppStyles
                                  .fontblackstyle.copyWith(fontSize: 15.sp),),
                              SizedBox(height: 15.h),
                              CustomTextformfield(
                                controller: namecontroller,
                                icon: Container(
                                  padding: EdgeInsets.all(12.h),
                                  child: SvgPicture.asset(
                                    ImageAssetPath.profileIcon,
                                  ),
                                ),
                                hintText: 'Enter your name',
                                labelText: 'Full Name',
                                type: TextInputType.text,
                              ),
                              SizedBox(height: 10.h),
                              CustomNumberfield(
                                  controller: numbercontroller,
                                  type: TextInputType.number,
                                  hintText: 'Mobile Number',
                                  labelText: 'Mobile Number'
                              ),
                              SizedBox(height: 20.h),
                              Text('Your Address', style: AppStyles
                                  .homelogostyle.copyWith(fontSize: 15.sp),),
                              SizedBox(height: 10.h),
                              InkWell(
                                onTap: () {
                                  StreamUtil.addressbuttoncondition.add(0);
                                  Navigator.pushNamed(
                                      context, AppScreens.changeAddress);
                                },
                                child: Container(
                                  height: 60.h,
                                  width: 350.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppStyles.backgroundcolor
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        SvgPicture.asset(ImageAssetPath.addIcon,
                                            height: 16.67.h, width: 16.67.w),
                                        SizedBox(width: 6.67.w),
                                        Text('Add Service Location',
                                            style: AppStyles.termstyle),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text('Select Date & Time Slot', style: AppStyles
                                  .homelogostyle.copyWith(fontSize: 15.sp),),
                              SizedBox(height: 16.h),
                              InkWell(
                                onTap: ()async {
                                  DateTime? newDate = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate:DateTime(2322),
                                    initialDate: DateTime.now(),
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme:  ColorScheme.light(
                                            primary: AppStyles.red,
                                            onPrimary: AppStyles.white,
                                            onSurface: AppStyles.black,
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              primary: AppStyles
                                                  .red, // button text color
                                            ),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );
                                  setState(() {
                                    updateDate =
                                        DateTimeUtils.formatBirthDate(newDate);
                                    dateForShown =
                                        DateTimeUtils.formatBirthDateForShown(
                                            newDate);
                                  });
                                  print(updateDate);
                                },
                                child: Container(
                                  height: 55.h,
                                  width: 350.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: AppStyles.grey.withOpacity(0.20))
                                  ),
                                  child: Padding(padding: EdgeInsets.symmetric(
                                      horizontal: 18.sp, vertical: 5),
                                    child:

                                    Row(mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Date',
                                              style: AppStyles.termstyle.copyWith(
                                                  fontSize: 12.sp),),
                                            SizedBox(height: 2.h),
                                            Text(dateForShown ?? 'Select Date',
                                                style: AppStyles.homelogostyle
                                                    .copyWith(fontSize: 14.sp)),
                                          ],),
                                        SvgPicture.asset(
                                            ImageAssetPath.redbooking,
                                            height: 20.h, width: 18.w),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 19.h),
                              GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                      childAspectRatio: 1.45
                                  ),
                                  itemCount: timelist.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: InkWell(
                                        onTap: (){
                                          setState(() {
                                            selectIndex = index;
                                            selectTime = timelist[index];
                                          });
                                        },
                                        child: CustomTimeContainer(
                                          time: timelist[index],
                                            isSelected: selectIndex==index ? true: false
                                        ),
                                      ),
                                    );
                                  }
                              ),
                              SizedBox(height: 62.h),
                              CustomBottomButton(
                                onPress: () async {
                                  bool isInternet = await AppUtils.checkInternet();
                                  if (isInternet) {
                                    var data = {
                                      "sub_service" : StreamUtil.subserviceid.value,
                                      "category": StreamUtil.categoryid.value,
                                      "prizes" : StreamUtil.prizeid.value,
                                      "name" : namecontroller.text,
                                      "mobileNumber" : numbercontroller.text,


                                    };
                                    BlocProvider.of<LoginBookServiceBloc>(context).add(
                                      PerformLoginBookServiceEvent(data: data),
                                    );
                                  } else {
                                    AlertUtils.showNotInternetDialogue(context);
                                  }

                                },
                                text: 'REQUEST SEND',),
                            ],
                          )
                      )
                  ),

                ],
              )
          ),
        )
    );
  },
);
  }
}




