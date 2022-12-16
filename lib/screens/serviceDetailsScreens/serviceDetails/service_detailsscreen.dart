import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../../app_screens/app_screens.dart';
import '../../../constants/asset_path.dart';
import '../../../widgets/custom_account_backbutton.dart';
import '../../../widgets/custom_backicon_button.dart';
import '../../../widgets/custom_photo_cotainer.dart';

import '../../../widgets/custom_service_container.dart';
import 'bloc/service_details_bloc.dart';

class ServiceDetailsScreen extends StatelessWidget {

  ServiceDetailsScreen({Key? key}) : super(key: key);

  List<String> sphotolist = ['${ImageAssetPath.sPhoto1}','${ImageAssetPath.sPhoto2}','${ImageAssetPath.sPhoto3}', '${ImageAssetPath.sPhoto4}' ];

  List<String> servicelist =
  ['Unfurnished Apartment classic\ncleaning',
   'Furnished Apartment classic\ncleaning',
    'Unfurnished Apartment premium\ncleaning',
    'Furnished Apartment premium\ncleaning',
    'Furnished Apartment premium\ncleaning',
    'Furnished Apartment Super Elite\ncleaning',
    'Unfurnished Villa cleaning',
    'Furnished Villa Classic\ncleaning',
    'Premium Villa Cleaning',
    'Duplex Apartment Premium\nCleaning'
  ];

  static Widget create(){
    return MultiBlocProvider(
      providers: [
        BlocProvider<ServiceDetailsBloc>(
          create: (_) => ServiceDetailsBloc(),
        ),
      ],
      child: ServiceDetailsScreen(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              //height:844.h,
              width: 390.w,
              color: AppStyles.black,
              child: (
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAccountBackbutton(),
                  Image.asset(ImageAssetPath.homeLogo, height:150.h, width:390.w, fit: BoxFit.fill,),
                  Container(
                    height: 880.h,
                    width: 390.w,
                    color: AppStyles.white,
                    child:
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          //SizedBox(height: 18.44),
                        Text('Full Home Deep Cleaning', style: AppStyles.verifystyle.copyWith(fontSize: 18.sp) ,),
                          SizedBox(height: 5),
                          Text('Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.Maecenas sed diam eget risus varius blandit sit amet non ', style:AppStyles.termstyle.copyWith(color:AppStyles.fontcolorgrey) ,),
                        SizedBox(height: 34.h),
                          Container(

                            height: 688.h,
                            width: 350.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppStyles.grey.withOpacity(0.16)),
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(top: 23.sp, right: 16.sp, left: 16.sp, bottom: 19.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Types of Sub Services', style: AppStyles.homelogostyle.copyWith(fontSize: 14.sp),),
                                  Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: servicelist.length,
                                      itemBuilder: (buildcontext, index){
                                        return InkWell(
                                            onTap: (){
                                              Navigator.pushNamed(context, AppScreens.subserviceDetails);
                                            },
                                            child: CustomServiceContainer(text: servicelist[index],));
                                      }),
                                  ),
                                  SizedBox(height: 15.h),
                                  Text('All Service Photos', style: AppStyles.homelogostyle.copyWith(fontSize: 14.sp),),
                                  SizedBox(height: 15.h),
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

                                ],
                              ),
                            ),

                          )
                        ]
                  ),
                    ),
                  )
                ],
              )
              ),
            ),
          )
      ,
    ));
  }
}
