import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gfive/utils/app_styles.dart';
import 'package:gfive/widgets/loading_container.dart';

import '../../../app_screens/app_screens.dart';
import '../../../constants/asset_path.dart';
import '../../../utils/alert_utils.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/stream_builder.dart';
import '../../../widgets/custom_account_backbutton.dart';
import '../../../widgets/custom_backicon_button.dart';
import '../../../widgets/custom_photo_cotainer.dart';

import '../../../widgets/custom_service_container.dart';
import 'bloc/service_details_bloc.dart';
import 'model/category_model.dart';

class ServiceDetailsScreen extends StatefulWidget {
  String? categoryid;

  ServiceDetailsScreen({Key? key, required this.categoryid}) : super(key: key);


  static Widget create(String? categoryid){
    return MultiBlocProvider(
      providers: [
        BlocProvider<ServiceDetailsBloc>(
          create: (_) => ServiceDetailsBloc(),
        ),
      ],
      child: ServiceDetailsScreen(
        categoryid: categoryid,
      ),
    );
  }

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  List<String> sphotolist = ['${ImageAssetPath.sPhoto1}','${ImageAssetPath.sPhoto2}','${ImageAssetPath.sPhoto3}', '${ImageAssetPath.sPhoto4}' ];
  CategoryModel? categorydata;
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

  @override
  void initState() {
    // TODO: implement initState

    print('categoryid===>${widget.categoryid}');
    apicall();


    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    return SafeArea(child: BlocConsumer<ServiceDetailsBloc, ServiceDetailsState>(
  listener: (context, state) {
    // TODO: implement listener
    if(state.isCompleted){
      categorydata = state.model!;
    }
  },
  builder: (context, state) {
    return Scaffold(
          body: Stack(
            children: [
              categorydata == null ? LoadingContainer() :
              SingleChildScrollView(
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
                                height: 1032.h,
                                width: 390.w,
                                color: AppStyles.white,
                                child:
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      //SizedBox(height: 18.44),
                                      Text('${categorydata!.data!.category}', style: AppStyles.verifystyle.copyWith(fontSize: 18.sp) ,),
                                      SizedBox(height: 5),
                                      Text('${categorydata!.data!.description}', style:AppStyles.termstyle.copyWith(color:AppStyles.fontcolorgrey) ,),
                                      SizedBox(height: 34.h),
                                      Container(

                                        height: 688.h,
                                        width: 350.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(color: AppStyles.grey.withOpacity(0.16)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 23.sp, right: 16.sp, left: 16.sp, bottom: 6.sp),
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Types of Sub Services', style: AppStyles.homelogostyle.copyWith(fontSize: 14.sp),),
                                                SizedBox(height: 19.h),
                                                Expanded(
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      physics: PageScrollPhysics(),
                                                      itemCount:categorydata!.data!.subServices!.length,
                                                      itemBuilder: (buildcontext, index){
                                                        return InkWell(
                                                            onTap: (){
                                                              StreamUtil.subserviceid.add(categorydata!.data!.subServices![index].id!);
                                                              StreamUtil.subservicename.add(categorydata!.data!.subServices![index].name!);
                                                              Navigator.pushNamed(context, AppScreens.subserviceDetails, arguments:{'subserviceid':categorydata!.data!.subServices![index].id!} );
                                                            },
                                                            child: CustomServiceContainer(text: categorydata!.data!.subServices![index].name!,));
                                                      }),
                                                ),
                                              ]),
                                        ),
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
                        )
                    ),
                  )


              ),
            ],

          ),
            );
  },
),
          );
  }

  void apicall()  async {
    bool isInternet = await AppUtils.checkInternet();
    if (isInternet) {
      BlocProvider.of<ServiceDetailsBloc>(context).add(
          PerformServiceDetailsEvent(id: widget.categoryid!),
      );

          } else {
      AlertUtils.showNotInternetDialogue(context);
    }



  }
}
