import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/screens/bookingServiceDetails/book_service_screen.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../app_screens/app_screens.dart';
import '../../utils/alert_utils.dart';
import '../../utils/app_utils.dart';
import '../../widgets/custom_booking_container.dart';
import '../../widgets/loading_container.dart';
import 'bloc/booking_history_bloc.dart';
import 'model/booking_history_model.dart';


class BookMainScreen extends StatefulWidget {
  const BookMainScreen({Key? key}) : super(key: key);

  @override
  State<BookMainScreen> createState() => _BookMainScreenState();
}

class _BookMainScreenState extends State<BookMainScreen> {

  BookingHistoryModel? bookingdata;

  @override
  void initState()  {
    // TODO: implement initState

   apicall();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocConsumer<BookingHistoryBloc, BookingHistoryState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state.isCompleted){
          bookingdata = state.model!;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: bookingdata == null ? LoadingContainer() : Container(
              height: 844.h,
              width: 390.w,
              color: AppStyles.black,
              child:
              Column(children: [
                Padding(padding: EdgeInsets.only(top: 49, bottom: 24),
                  child: Text('My Bookings', style: AppStyles.profilestyle),
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(20),
                      width: 390.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15),

                          ),
                          color: AppStyles.white
                      ),
                      child: ListView.builder(
                          itemCount: bookingdata!.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                print('Hellow');
                                Navigator.pushNamed(
                                    context, AppScreens.bookingDetail);
                              },
                              child: CustomBookingContainer(
                                bookingid: bookingdata!.data![index].id!,
                                bdate: bookingdata!.data![index].bookingDate!.toString(),
                                btime: bookingdata!.data![index].bookingtime!,
                                subservice: bookingdata!.data![index].subService![0].name!.toString(),
                                prizetitle: bookingdata!.data![index].prizes![0].title.toString(),
                                bstatus: bookingdata!.data![index].status! == 'P' ? 'Upcoming'
                                         : bookingdata!.data![index].status! == 'Done' ? 'Completed'
                                         : 'Cancelled',
                                  statusfontstyle: bookingdata!.data![index].status! == 'P' ? AppStyles.bookingstyle.copyWith(color: AppStyles.bfontcolor)
                                                   : bookingdata!.data![index].status! == 'Done' ? AppStyles.bookingstyle.copyWith(color: AppStyles.statusfonts)
                                                   : AppStyles.bookingstyle.copyWith(color: AppStyles.grey),
                                prize: bookingdata!.data![index].prizes![0].prize.toString(),
                              ),
                            );
                          }


                      )


                  ),
                ),

              ],
              )
          ),
        );
      },
    ));
  }

  void apicall() async{
    bool isInternet = await AppUtils.checkInternet();
    if (isInternet) {
      BlocProvider.of<BookingHistoryBloc>(context).add(
        PerformBookingHistoryEvent(),
      );
    } else {
      AlertUtils.showNotInternetDialogue(context);
    }
  }
}
