import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gfive/utils/app_styles.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

import '../../constants/asset_path.dart';
import '../../utils/alert_utils.dart';
import '../../utils/app_utils.dart';
import '../../utils/date_time_utils.dart';
import '../../utils/stream_builder.dart';
import '../../widgets/custom_account_backbutton.dart';
import '../../widgets/custom_backicon_button.dart';
import '../../widgets/custom_bottom_button.dart';
import '../../widgets/custom_cancelservice_container.dart';
import '../../widgets/custom_clickable_container.dart';
import '../../widgets/custom_dialog_bottom_button.dart';
import '../../widgets/custom_dotted_divider.dart';
import '../../widgets/custom_time_container.dart';
import '../myBookingScreens/model/booking_history_model.dart';
import 'bloc/booking_service_details_bloc.dart';
import 'bloc/cancel_booking_bloc.dart';
import 'bloc/reschedule_booking_bloc.dart';

class BookServiceScreen extends StatefulWidget {
  //String sdate;
  Datum? bookingdata;

  BookServiceScreen({Key? key, required this.bookingdata}) : super(key: key);

  static Widget create(Datum? bookingdata) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookingServiceDetailsBloc>(
          create: (_) => BookingServiceDetailsBloc(),
        ),
        BlocProvider<RescheduleBookingBloc>(
          create: (_) => RescheduleBookingBloc(),
        ),
      ],
      child: BookServiceScreen(bookingdata: bookingdata),
    );
  }

  @override
  State<BookServiceScreen> createState() => _BookServiceScreenState();
}

class _BookServiceScreenState extends State<BookServiceScreen> {
  List timelist = [
    '08:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM'
  ];

  List reasonlist = [
    'We are not at home',
    'Booked by mistake',
    'Other'
  ];

  String? selectTime;

  String? dateForShown;
  String? updateDate;

  BehaviorSubject<String> rescheduleDate = BehaviorSubject<String>.seeded('');
  BehaviorSubject<String> rescheduleSDate = BehaviorSubject<String>.seeded('Select Date');

  BehaviorSubject<int> selectIndex = BehaviorSubject<int>.seeded(0);
  BehaviorSubject<int> cancelIndex = BehaviorSubject<int>.seeded(0);

@override
  void initState() {
    // TODO: implement initState
    super.initState();
   // rescheduleSDate.add('${DateFormat('dd MMM yyyy').format(widget.bookingdata!.bookingDate!.toLocal())}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<RescheduleBookingBloc, RescheduleBookingState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state.isCompleted) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Stack(children: [
                Container(
                  //height: 844.h,
                  width: 390.w,
                  color: widget.bookingdata!.status == 'P'
                      ? AppStyles.bfontcolor
                      : widget.bookingdata!.status == 'D'
                          ? AppStyles.statusfonts
                          : AppStyles.grey,
                ),
                Container(
                    height: 844.h,
                    width: 390.w,
                    //color: AppStyles.bfontcolor,
                    color: widget.bookingdata!.status == 'P'
                        ? AppStyles.bfontcolor
                        : widget.bookingdata!.status == 'D'
                            ? AppStyles.statusfonts
                            : AppStyles.grey,
                    child:
                        Image.asset(ImageAssetPath.dotted, fit: BoxFit.fill)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAccountBackbutton(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 100.h),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(widget.bookingdata!.id!,
                                style: AppStyles.buttonstyle
                                    .copyWith(fontSize: 16.sp)),
                            Text(
                              '${DateFormat('dd MMM yyyy').format(widget.bookingdata!.createdAt!.toLocal())} | ${DateFormat.jm().format(widget.bookingdata!.createdAt!.toLocal())}',
                              style: AppStyles.bookingstyle
                                  .copyWith(color: AppStyles.white),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 26.h),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      height: 686.h,
                      width: 390.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppStyles.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //padding: EdgeInsets.only(top: 23.sp),

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppStyles.backgroundcolor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 23.sp, left: 16.sp, bottom: 19.sp),
                                  child: Row(
                                    children: [
                                      Text('Service Date -Time & Address',
                                          style: AppStyles.fontblackstyle),
                                    ],
                                  ),
                                ),
                                MySeparator(height: 0.5, color: AppStyles.grey),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 13.sp,
                                      right: 16.sp,
                                      left: 16.sp,
                                      bottom: 16.sp),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${DateFormat('dd MMM yyyy').format(widget.bookingdata!.bookingDate!.toLocal())}',
                                                style: AppStyles.fontblackstyle
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700),
                                              ),
                                              SizedBox(height: 3),
                                              Text('Date',
                                                  textAlign: TextAlign.start,
                                                  style: AppStyles.termstyle),
                                            ]),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.bookingdata!.bookingtime
                                                  .toString(),
                                              style: AppStyles.fontblackstyle
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                            SizedBox(height: 5),
                                            Text('Time',
                                                style: AppStyles.termstyle),
                                          ],
                                        ),
                                      ]),
                                ),
                                MySeparator(height: 0.5, color: AppStyles.grey),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 16, bottom: 15),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            ImageAssetPath.bookLocation,
                                            height: 43.h,
                                            width: 43.w),
                                        SizedBox(width: 11.w),
                                        Text(
                                            '${widget.bookingdata!.address![0].houseno} ${widget.bookingdata!.address![0].address},\n ${widget.bookingdata!.address![0].city} ${widget.bookingdata!.address![0].zipcode}',
                                            style: AppStyles.sfstyle),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 14),
                            child: Text('Service Info',
                                style: AppStyles.fontblackstyle),
                          ),
                          Container(
                              //height: 132.h,
                              width: 350.w,
                              padding: EdgeInsets.only(
                                  top: 23.sp, left: 19.sp, bottom: 14.sp),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppStyles.backgroundcolor),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      '${widget.bookingdata!.category![0].category}',
                                      style: AppStyles.fontblackstyle
                                          .copyWith(fontSize: 16.sp)),
                                  SizedBox(height: 5.h),
                                  Text(
                                      '${widget.bookingdata!.subService![0].name!}',
                                      style: AppStyles.termstyle),
                                  SizedBox(height: 5.h),
                                  Text(
                                      '${widget.bookingdata!.prizes![0].title}',
                                      style: AppStyles.redstyle),
                                ],
                              )),
                          SizedBox(height: 15.h),
                          widget.bookingdata!.status == 'P'
                              ? Column(children: [
                                  CustomClickableContainer(
                                    text: 'Reschedule Service',
                                    image: ImageAssetPath.calenderIcon,
                                    onPress: () {
                                      print('Hellow');
                                      rescheduleDialog(
                                          context: context/*, timelist: timelist*/);
                                    },
                                  ),
                                  SizedBox(height: 8.h),
                                  CustomClickableContainer(
                                    text: 'Cancel Service',
                                    image: ImageAssetPath.crossIcon,
                                    onPress: () {
                                      cancelDialog(context: context);
                                    },
                                  ),
                                  SizedBox(height: 35),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              '₹ ${widget.bookingdata!.prizes![0].prize}',
                                              style: AppStyles.redfontstyle),
                                          SizedBox(height: 11),
                                          Text('Total Amount',
                                              style: AppStyles.termstyle),
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      InkWell(
                                        onTap: () {
                                          paymentDialog(context: context);
                                        },
                                        child: Container(
                                          height: 55,
                                          width: 234,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: AppStyles.black),
                                          child: Center(
                                            child: Text('PAY NOW',
                                                style: AppStyles.buttonstyle),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ])
                              : widget.bookingdata!.status == 'D'
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 58.h,
                                            width: 350.w,
                                            decoration: BoxDecoration(
                                                color: AppStyles.white,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Center(
                                                child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    ImageAssetPath.feedbackIcon,
                                                    height: 18.62.h,
                                                    width: 22.86.w),
                                                Text(
                                                  'Write a Feedback',
                                                  style: AppStyles.homelogostyle
                                                      .copyWith(
                                                          fontSize: 14.sp),
                                                )
                                              ],
                                            ))),
                                        SizedBox(height: 115.h),
                                        Text(
                                          '₹ ${widget.bookingdata!.prizes![0].prize}',
                                          style: AppStyles.redstyle.copyWith(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(height: 11.h),
                                        Text('Total Amount',
                                            style: AppStyles.termstyle),
                                      ],
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 175.h,
                                            width: 350.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color:
                                                    AppStyles.backgroundcolor),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 13,
                                                  top: 18,
                                                  bottom: 14,
                                                  left: 13),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Cancellation Reason',
                                                    style: AppStyles.redstyle
                                                        .copyWith(
                                                            fontSize: 15.sp),
                                                  ),
                                                  SizedBox(height: 12.h),
                                                  Container(
                                                      height: 110.h,
                                                      width: 324.w,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: AppStyles
                                                              .white),
                                                      child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      17.h,
                                                                  vertical:
                                                                      14.w),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text('Other',
                                                                  style: AppStyles
                                                                      .homelogostyle),
                                                              SizedBox(
                                                                  height: 5),
                                                              Text(
                                                                  'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere',
                                                                  style: AppStyles
                                                                      .termstyle),
                                                            ],
                                                          )))
                                                ],
                                              ),
                                            )),
                                        SizedBox(height: 10),
                                        Text(
                                          '₹ ${widget.bookingdata!.prizes![0].prize}',
                                          style: AppStyles.redstyle.copyWith(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(height: 4.h),
                                        Text('Total Amount',
                                            style: AppStyles.termstyle),
                                      ],
                                    )
                        ],
                      ),
                    )
                  ],
                ),

                /*SizedBox(
                  height: 844.h,
                  child: Image.asset(ImageAssetPath.dotted, fit: BoxFit.fill)),*/
              ]),
            ),
          );
        },
      ),
    );
  }

  void rescheduleDialog(
      {BuildContext? context,
      Function? pressLogout,
      Function? pressCancle,
      String? title,
      String? message,
      String? btn1,
      String? btn2}) {
    showGeneralDialog(
      barrierLabel: "Label2",
      barrierDismissible: true,
      barrierColor: Colors.black45.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      context: context!,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 467.h,
            child: SizedBox.expand(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.sp),
                    topRight: Radius.circular(10.sp)),
                child: Scaffold(
                  body: Container(
                    // height:350,
                    width: 390,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 26, right: 20, left: 20, bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Reschedule Service',
                                style: AppStyles.homelogostyle
                                    .copyWith(fontSize: 18.sp),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                'Choose your preferred date& time\nreschedule services.',
                                textAlign: TextAlign.center,
                                style: AppStyles.termstyle
                                    .copyWith(fontSize: 15.sp),
                              ),
                              SizedBox(height: 35.h),
                              Text(
                                'Select Date & Time Slot',
                                style: AppStyles.homelogostyle
                                    .copyWith(fontSize: 15.sp),
                              ),
                              SizedBox(height: 16.sp),
                              /*Container(
                                  height: 55.h,
                                  width: 350.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: AppStyles.grey.withOpacity(0.20))
                                  ),
                                  child: Padding(padding: EdgeInsets.symmetric(
                                      horizontal: 18.sp, vertical: 5),
                                    child:*/

                              InkWell(
                                onTap: () async {
                                  DateTime? newDate = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2322),
                                    initialDate: DateTime.now(),
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
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
                                  rescheduleDate.add( DateTimeUtils.formatBirthDate(newDate));
                                  rescheduleSDate.add(  DateTimeUtils.formatBirthDateForShown(
                                      newDate));
                                  print(rescheduleSDate.value);

                                },
                                child: Container(
                                  height: 55.h,
                                  width: 350.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: AppStyles.grey
                                              .withOpacity(0.20))),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 18.sp, vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Date',
                                              style: AppStyles.termstyle
                                                  .copyWith(fontSize: 12.sp),
                                            ),
                                            SizedBox(height: 2.h),
                                            StreamBuilder<String>(
                                              stream: rescheduleSDate,
                                              builder: (context, snapshot) {
                                                return Text('${snapshot.data}',
                                                    style: AppStyles.homelogostyle
                                                        .copyWith(fontSize: 14.sp));
                                              }
                                            ),
                                          ],
                                        ),
                                        SvgPicture.asset(
                                            ImageAssetPath.redbooking,
                                            height: 20.h,
                                            width: 18.w),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              //SizedBox(height: 2.h),
                              Expanded(
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            crossAxisSpacing: 8.0,
                                            mainAxisSpacing: 8.0,
                                            childAspectRatio: 1.45),
                                    itemCount: timelist.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: InkWell(
                                          onTap: () {
                                            selectIndex.add(index);
                                            selectTime = timelist[index];
                                            StreamUtil.time.add(selectTime!);

                                            print('SelectedIndex $selectIndex');
                                          },
                                          child: StreamBuilder<int>(
                                            stream: selectIndex,
                                            builder: (context, snapshot) {
                                              return snapshot.data == null ? Container() : CustomTimeContainer(
                                                  time: timelist[index],
                                                  isSelected: snapshot.data ==index ? true: false

                                                      );
                                            }
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              SizedBox(height: 20.h),
                              CustomDialogBottomButton(
                                title: 'Reschedule',
                                onPress: () async {
                                  bool isInternet =
                                      await AppUtils.checkInternet();
                                  if (isInternet) {
                                    rescheduleAPI();

                                    //Navigator.pop(context);
                                  } else {
                                    AlertUtils.showNotInternetDialogue(context);
                                  }
                                },
                              ),
                            ])),
                  ),
                ),
              ),
            ),
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

  void cancelDialog({
    BuildContext? context,
    Function? pressLogout,
    Function? pressCancle,
    String? title,
    String? message,
    String? btn1,
    String? btn2,
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
                height: 588.h,
                child: SizedBox.expand(
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.sp),
                            topRight: Radius.circular(10.sp)),
                        child: Scaffold(
                          body: Container(
                            height: 588.h,
                            width: 390.w,
                            color: AppStyles.white,
                            child: Column(
                              children: [
                                SizedBox(height: 26.h),
                                Text('Cancel Service',
                                    style: AppStyles.homelogostyle
                                        .copyWith(fontSize: 18.sp)),
                                SizedBox(height: 10.h),
                                Text(
                                  'Cancel service by giving proper reason.',
                                  style: AppStyles.termstyle
                                      .copyWith(fontSize: 15.sp),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 30.sp, right: 36.sp, left: 36.sp),
                                  child: ListView.builder(
                                      itemCount: reasonlist.length,
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        return InkWell(
                                            onTap: () {
                                              cancelIndex.add(index);
                                            },
                                            child: StreamBuilder<int>(
                                                stream: cancelIndex,
                                                builder: (context, snapshot) {
                                                  return snapshot.data == null
                                                      ? Container()
                                                      : CustomCancelServiceContainer(
                                                      text: reasonlist[index],
                                                      isCancelselected: snapshot
                                                          .data == index
                                                          ? true
                                                          : false
                                                  );
                                                }
                                            )
                                        );
                                      }
                                  ),
                                ),


                                SizedBox(height: 10.h),
                                Container(
                                  height: 131.h,
                                  width: 318.w,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(5),
                                      border: Border.all(
                                          color: AppStyles.grey
                                              .withOpacity(0.2)),
                                      color: AppStyles.white),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.sp,
                                        vertical: 12.sp),
                                    child: Text('Description',
                                        style: AppStyles.termstyle),
                                  ),
                                ),
                                SizedBox(height: 100.h),
                                CustomBottomButton(
                                  onPress: () {},
                                  /*async {
                                    bool isInternet = await AppUtils
                                        .checkInternet();
                                    if (isInternet) {
                                      var data = {
                                        "reason":
                                        "discription"
                                      }

                                      BlocProvider.of<CancelBookingBloc>(
                                          context).add(
                                        PerformCancelBookingEvent(
                                            data: data, id :),
                                      );
                                    } else {
                                      AlertUtils.showNotInternetDialogue(
                                          context);
                                    }
                                  },*/
                                  text: 'Submit',
                                )
                              ],
                            ),
                          ),
                        ),
                    ))));
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

  void paymentDialog({
    BuildContext? context,
    Function? pressLogout,
    Function? pressCancle,
    String? title,
    String? message,
    String? btn1,
    String? btn2,
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
            height: 350.h,
            child: SizedBox.expand(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.sp),
                    topRight: Radius.circular(10.sp)),
                child: Scaffold(
                  body: Container(
                    height: 350,
                    width: 390,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 26, horizontal: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Payment',
                                style: AppStyles.homelogostyle
                                    .copyWith(fontSize: 18.sp),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                'Enter your service amount and pay to\nservice provider',
                                textAlign: TextAlign.center,
                                style: AppStyles.termstyle
                                    .copyWith(fontSize: 15.sp),
                              ),
                              SizedBox(height: 19.h),
                              Container(
                                height: 105.h,
                                width: 349.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppStyles.lightgrey),
                                child: Center(
                                  child: Text(
                                    'Enter Amount',
                                    style: AppStyles.termstyle.copyWith(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              SizedBox(height: 23.h),
                              CustomDialogBottomButton(
                                title: 'Submit',
                                onPress: () {},
                              ),
                            ])),
                  ),
                ),
              ),
            ),
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

  void rescheduleAPI() {
    var data = {
      "BookingDate": rescheduleDate.value,
      "Bookingtime": StreamUtil.time.value
    };

    BlocProvider.of<RescheduleBookingBloc>(context).add(
      PerformRescheduleBookingEvent(data: data, id: widget.bookingdata!.id!),
    );
  }
}
