import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gfive/utils/app_styles.dart';
import 'package:rxdart/rxdart.dart';

import '../../../app_screens/app_screens.dart';
import '../../../constants/asset_path.dart';
import '../../../widgets/custom_account_backbutton.dart';
import '../../../widgets/custom_backicon_button.dart';
import '../../../widgets/custom_bottom_button.dart';
import '../../../widgets/custom_otp_button.dart';
import '../../../widgets/custom_photo_cotainer.dart';
import '../../../widgets/custom_price_container.dart';
import '../../../widgets/custom_row.dart';
import 'bloc/subservice_details_bloc.dart';

class SubserviceDetails extends StatelessWidget {

   SubserviceDetails({Key? key}) : super(key: key);

  List<String> pricelist = ['100', '200', '300','400','500'];
  List<String> namelist = ['1BHK', '2BHK', '3BHK', '4BHK', '5BHK'];
  List<String> sphotolist = ['${ImageAssetPath.sPhoto1}','${ImageAssetPath.sPhoto2}','${ImageAssetPath.sPhoto3}', '${ImageAssetPath.sPhoto4}' ];

   static Widget create(){
     return MultiBlocProvider(
       providers: [
         BlocProvider<SubserviceDetailsBloc>(
           create: (_) => SubserviceDetailsBloc(),
         ),
       ],
       child: SubserviceDetails(),
     );
   }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 844.h,
          width: 390.w,
          color: AppStyles.black,
          child:
            SingleChildScrollView(
              child: Padding(padding: EdgeInsets.only(top:10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  CustomAccountBackbutton(),
                 Row(children: [
                   SizedBox(width: 65.w),
                  Text('Unfurnished Appartment Classic\nCleaning', textAlign: TextAlign.center, style:AppStyles.profilestyle),
                ]),
                   SizedBox(height: 15),
                Container(
                  height: 909.h,
                  width: 390.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: AppStyles.white
                  ),
                  child:Padding(padding: EdgeInsets.only(top:19, right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(textAlign: TextAlign.left, 'Maecenas sed diam eget risus varius blandit sit\namet non magna. Integer posuere erat a ante\nvenenatis dapibus posuere velit aliquet.Maecenas\nsed diam eget risus varius blandit sit amet non' , style: AppStyles.detailsstyle,),
                    Row(
                      children: [
                        Text(' Readmore', style: AppStyles.detfontstyle),
                        SizedBox(width: 6.67.w),
                        SvgPicture.asset(ImageAssetPath.downarrowIcon,height: 6.h,width:10.67.w ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(color:AppStyles.divider,thickness: 1),
                    SizedBox(height: 15),
                    Text(textAlign: TextAlign.left,'Service Price List', style:AppStyles.detfontstyle.copyWith(fontWeight: FontWeight.w600)),
                     GridView.builder(
                       shrinkWrap: true,
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 3,
                           crossAxisSpacing: 14.0,
                           mainAxisSpacing: 14.0
                         ),
                         itemCount: pricelist.length,
                         itemBuilder: (context, index){
                           return CustomPriceContainer(

                             price: pricelist[index],
                             name: namelist[index],

                           );
                         }
                     ),

                    SizedBox(height: 15),
                    Container(
                      height : 191.h,
                        width: 350.w,
                      decoration: BoxDecoration(
                          color: AppStyles.yellow,
                        borderRadius: BorderRadius.circular(5),
                      ),
                       child:Padding(padding: EdgeInsets.only(top: 21, right: 21, left: 18),
                       child:Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                         Text('Included', style: AppStyles.homelogostyle),
                           SizedBox(height: 15),
                           CustomRow(text: 'Bathroom Deep Cleaning'),

                           SizedBox(height: 10),
                           CustomRow(text: 'Kitchen Deep Cleaning With Chimney'),
                           SizedBox(height: 10),
                           CustomRow(text: 'Appliances Not Included'),
                           SizedBox(height: 10),
                           CustomRow(text: 'Floor Wiping And Mopping Of Entire House'),

                       ],))
                    ),
                    SizedBox(height: 15),
                    Text('Service Photos', style: AppStyles.homelogostyle.copyWith(fontSize: 14.sp),),
                    SizedBox(height: 15),
                    Container(
                      height: 79,
                      child: ListView.builder(
                        shrinkWrap: true,
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder:(BuildContext context, int index)
                          {
                            return CustomPhotoContainer(imagepath: sphotolist[index]);
                          }
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomBottomButton(
                      text : 'BOOK SERVICE',
                      onPress: (){
                        Navigator.pushNamed(context, AppScreens.loginBookservice);
                      },
                    )
                  ],),
                  )
                )
                ],
              ),
              ),
            )
        ),
      ),
    );
  }
}
