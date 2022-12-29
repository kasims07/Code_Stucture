import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gfive/utils/app_styles.dart';
import 'package:gfive/widgets/loading_container.dart';
import 'package:rxdart/rxdart.dart';

import '../../../app_screens/app_screens.dart';
import '../../../constants/asset_path.dart';
import '../../../utils/alert_utils.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/stream_builder.dart';
import '../../../widgets/custom_account_backbutton.dart';
import '../../../widgets/custom_backicon_button.dart';
import '../../../widgets/custom_bottom_button.dart';
import '../../../widgets/custom_otp_button.dart';
import '../../../widgets/custom_photo_cotainer.dart';
import '../../../widgets/custom_price_container.dart';
import '../../../widgets/custom_row.dart';
import 'bloc/subservice_details_bloc.dart';
import 'model/subservice_model.dart';

class SubserviceDetails extends StatefulWidget {
String? subserviceid;
   SubserviceDetails({Key? key, required this.subserviceid}) : super(key: key);


   static Widget create(String? subserviceid){
     return MultiBlocProvider(
       providers: [
         BlocProvider<SubserviceDetailsBloc>(
           create: (_) => SubserviceDetailsBloc(),
         ),
       ],
       child: SubserviceDetails(subserviceid: subserviceid,),
     );
   }

  @override
  State<SubserviceDetails> createState() => _SubserviceDetailsState();
}

class _SubserviceDetailsState extends State<SubserviceDetails> {
  //List<String> pricelist = ['100', '200', '300','400','500'];

  //List<String> namelist = ['1BHK', '2BHK', '3BHK', '4BHK', '5BHK'];

  List<String> sphotolist = ['${ImageAssetPath.sPhoto1}','${ImageAssetPath.sPhoto2}','${ImageAssetPath.sPhoto3}', '${ImageAssetPath.sPhoto4}' ];

  String? subserviceid;
  SubserviceModel? subservicedata;
  bool isSelected = false;
  
  @override
  void initState() {
    // TODO: implement initState
    apicall(widget.subserviceid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<SubserviceDetailsBloc, SubserviceDetailsState>(
  listener: (context, state) {
    // TODO: implement listener
    if(state.isCompleted){
      subservicedata = state.model!;
    }
  },
  builder: (context, state) {
    return Scaffold(
        body: Stack(
          children :[
            subservicedata ==null ? LoadingContainer() :
          Container(
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
                        Text('${subservicedata!.data!.name}', textAlign: TextAlign.center, style:AppStyles.profilestyle),
                      ]),
                      SizedBox(height: 15),
                      Container(
                          height: 890.h,
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
                                Text(textAlign: TextAlign.left, '${subservicedata!.data!.description}', style: AppStyles.detailsstyle,),
                                Row(
                                  children: [
                                    Text(' Readmore', style: AppStyles.detfontstyle),
                                    SizedBox(width: 6.67.w),
                                    SvgPicture.asset(ImageAssetPath.downarrowIcon,height: 6.h,width:10.67.w ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Divider(color:AppStyles.divider,thickness: 1),
                                SizedBox(height: 10),
                                Text(textAlign: TextAlign.left,'Service Price List', style:AppStyles.detfontstyle.copyWith(fontWeight: FontWeight.w600)),
                                SizedBox(height: 15.h),
                                Flexible(
                                  child: GridView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 14.0,
                                        mainAxisSpacing: 14.0,

                                      ),
                                      itemCount: subservicedata!.data!.prize!.length,
                                      itemBuilder: (context, index){
                                        return InkWell(
                                          onTap: (){
                                            for(int i = 0; i<subservicedata!.data!.prize!.length; i++ ){
                                              if( i == index){
                                                subservicedata!.data!.prize![i].isSelected = true;
                                                StreamUtil.prizeid.add(subservicedata!.data!.prize![i].id!);
                                                StreamUtil.prizetag.add(subservicedata!.data!.prize![i].prize!);
                                                StreamUtil.prizetitle.add(subservicedata!.data!.prize![i].title!);
                                              }else{
                                                subservicedata!.data!.prize![i].isSelected = false;
                                              }
                                            }
                                            setState(() {

                                             });
                                            },
                                          child: CustomPriceContainer(
                                            isSelected: subservicedata!.data!.prize![index].isSelected,
                                            price: subservicedata!.data!.prize![index].prize.toString(),
                                            //pricestyle: isSelected == true ?  AppStyles.profilestyle.copyWith(fontSize: 14.sp) : AppStyles.termstyle.copyWith(fontWeight: FontWeight.w600),

                                            name: subservicedata!.data!.prize![index].title!,
                                           // namestyle:isSelected == true ? AppStyles.buttonstyle.copyWith(fontSize: 18.sp) : AppStyles.verifystyle.copyWith(fontSize:18.sp) ,

                                          ),
                                        );
                                      }
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                                  child: Container(
                                     // height : 191.h,
                                      width: 350.w,
                                      padding: EdgeInsets.only(top:21 , right: 21, left: 18),
                                      decoration: BoxDecoration(
                                        color: AppStyles.yellow,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child:Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Included', style: AppStyles.homelogostyle),
                                          SizedBox(height: 15),
                                          Container(
                                            //height: 191.h,

                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              physics: NeverScrollableScrollPhysics(),
                                              itemCount: subservicedata!.data!.includes!.length,
                                                itemBuilder: (buildcontext, index){
                                                return Column(
                                                    children:[
                                                    CustomRow(text: subservicedata!.data!.includes![index].include!),
                                                    SizedBox(height: 10)
                                                    ]);

                                            }
                                            ),
                                          ),
                                        ],)
                                  ),
                                ),
                                //SizedBox(height: 15),
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
                                    validation();

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
          ]

        ),
      );
  },
),
    );
  }

  void apicall(String? id) async {
    bool isInternet = await AppUtils.checkInternet();
    if (isInternet) {

      BlocProvider.of<SubserviceDetailsBloc>(context).add(
          PerformSubserviceDetailsEvent(id: id!),
      );
          } else {
      AlertUtils.showNotInternetDialogue(context);
    }

  }

  void validation() {
    if(!StreamUtil.prizeid.hasValue){
      AlertUtils.showToast('Please select your preferrred service price from the list');
          }
    else{
    Navigator.pushNamed(context, AppScreens.loginBookservice);
    }

  }
}
