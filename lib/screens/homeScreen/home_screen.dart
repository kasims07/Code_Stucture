import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gfive/app_screens/app_screens.dart';
import 'package:gfive/utils/app_styles.dart';
import 'package:gfive/widgets/loading_container.dart';

import '../../constants/asset_path.dart';
import '../../utils/alert_utils.dart';
import '../../utils/app_utils.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_textformfield.dart';
import '../dashBoard/bloc/dashboard_bloc.dart';
import '../dashBoard/model/dashboard_model.dart';


class HomeScreen extends StatefulWidget {

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchcontroller = TextEditingController();

  AllCategoriesModel? homedata;

  void initState() {
    apicall();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: BlocConsumer<DashboardBloc, DashboardState>(
  listener: (context, state) {
    if(state.isCompleted){
      homedata=state.model!;
    }

    // TODO: implement listener
  },
  builder: (context, state) {
    return Stack(
        children: [
         homedata == null ? LoadingContainer() : Container(
            color: AppStyles.black,
            child:
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 36),
                  Image.asset(ImageAssetPath.logo),
                  SizedBox(height: 11),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(ImageAssetPath.locationIcon,height: 15.h, width: 12.75.w, color: AppStyles.grey),
                      Text(' Ahmedabad, 380062',style: AppStyles.profilestyle.copyWith(fontSize: 13, fontWeight: FontWeight.w400),)
                    ],),
                  SizedBox(height: 15),
                  Text('Hello ${homedata!.user!.name}', style: AppStyles.redstyle),
                  SizedBox(height: 5),
                  Text('What service do you need?', style: AppStyles.profilestyle.copyWith(fontSize: 20.sp),),
                  SizedBox(height: 19),
                  Padding(padding: EdgeInsets.only(top: 19, right: 20, left: 20, bottom: 0),
                    child:
                    Container(
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color:
                          AppStyles.white.withOpacity(0.15),),
                        child: TextFormField(
                            controller: searchcontroller,
                            keyboardType: TextInputType.text,

                            style: TextStyle(color: AppStyles.white.withOpacity(0.5)),
                            textAlignVertical: TextAlignVertical.center,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: 'Search services',
                              hintStyle: AppStyles.searchstyle,
                              labelStyle: AppStyles.searchstyle,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              border: InputBorder.none,
                              isCollapsed: true,

                              prefixIcon: Container(
                                height: 16.67.h,
                                width: 16.67.w,
                                child: Padding(padding: EdgeInsets.all(15),
                                  child:SvgPicture.asset(ImageAssetPath.searchIcon,  color: AppStyles.white.withOpacity(0.5)),

                                ),
                              ),



                            )
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding:EdgeInsets.only(top: 20, right: 20, left: 20),
                    width:390.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        ),

                        color: AppStyles.white
                    ),
                    child: Column(children: [
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, AppScreens.serviceDetails, arguments:{'categoryid':homedata!.data!.first.id});
                        },
                        child: Container(
                          height: 163.h,
                          width: 350.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppStyles.grey.withOpacity(0.16)),

                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                  top:18,
                                  left:-10,
                                  child: Image.asset(ImageAssetPath.homeLogo, height: 145.h, width: 372.w)),
                              Positioned(
                                  top: 15,
                                  right:30,

                                  child: Text('${homedata!.data!.first.category}',style: AppStyles.homelogostyle ,))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(

                        child: StaggeredGrid.count(
                          crossAxisCount: 3,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 6,
                          children: [
                              for(int i = 0; i< homedata!.data!.length; i++)
                              i == 0 ? Container() :  StaggeredGridTile.count(
                                  crossAxisCellCount:3,
                                  mainAxisCellCount: 3,
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pushNamed(context, AppScreens.serviceDetails, arguments:{'categoryid':homedata!.data![i].id});
                                    },
                                    child: CustomContainer(
                        text: homedata!.data![i].category!,
                        imagePath: ImageAssetPath.kitchenLogo,
                        imageHeight: 74,
                        imageWidth: 82.w,
                        topPadding: 2.h,
                        botPadding: 3.h,

                        ),
                                  ),
                        )

                          ],
                        ),
                      ),
                     /*   Container(height: 365,
                        child: Expanded(
                          child: GridView.builder(
                            shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 14,
                                mainAxisSpacing: 13,
                              ),
                              itemCount:homedata!.data!.length,
                              itemBuilder: (context, index){
                                return
                                   index! ==0 ? null :
                                   CustomContainer(
                                    text: homedata!.data![index].category!,
                                    imagePath: ImageAssetPath.kitchenLogo,
                                    imageHeight: 74,
                                    imageWidth: 82.w,
                                    topPadding: 2.h,
                                    botPadding: 3.h,

                                ) ;
                              }),
                        ),
                      ),*/

                      /*Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomContainer
                          (
                            text: 'Kitchen\nCleaning',
                            imagePath: ImageAssetPath.kitchenLogo,
                            imageHeight: 74.75.h,
                            imageWidth: 88.1.w,
                            topPadding: 16.20.h,
                            botPadding: 16.h,
                          ),
                          SizedBox(width:15.w),
                          CustomContainer(
                            text: 'Bathroom\nCleaning',
                            imagePath: ImageAssetPath.bathroomLogo,
                            imageHeight: 76.h,
                            imageWidth: 79.8.w,
                            topPadding: 18.h,
                            botPadding: 16.h,
                          ),
                          SizedBox(width:15.w),
                          CustomContainer(
                            text: 'Sofa\nShampooing',
                            imagePath: ImageAssetPath.sofaLogo,
                            imageHeight: 78.96.h,
                            imageWidth: 91.05.w,
                            topPadding: 20.99.h,
                            botPadding: 16.h,
                          ),

                        ],),
                      SizedBox(height: 15.h),*/
                      /*Row(children: [


                        CustomContainer(
                          text: 'Carpet\nShampooing',
                          imagePath: ImageAssetPath.carpet,
                          imageHeight:73.63.h,
                          imageWidth:94.95.w,
                          topPadding: 21.56.h,
                          botPadding: 16.h,
                        ),
                        SizedBox(width:15.w),
                        CustomContainer(
                          text: 'Metress\nShampooing',
                          imagePath: ImageAssetPath.metress,
                          imageHeight: 64.05.h,
                          imageWidth: 90.w,
                          topPadding: 28.98.h,
                          botPadding: 16.h,
                        ),
                        SizedBox(width:15.w),
                        CustomContainer(
                          text: 'Marble\nPolish',
                          imagePath: ImageAssetPath.marblepolish,
                          imageHeight: 86.4.h,
                          imageWidth: 92.w,
                          topPadding: 24.h,
                          botPadding: 16.h,
                        ),
                        SizedBox(height: 15.w),
                      ],)*/

                    ],),
                  )
                ],
              ),
            ),
          )
        ],
            );
  },
),
      ),


    );
  }

  void apicall() async {
    bool isInternet = await AppUtils.checkInternet();
    if (isInternet) {
      BlocProvider.of<DashboardBloc>(context).add(
          PerformDashboardEvent(),
      );
          } else {
      AlertUtils.showNotInternetDialogue(context);
    }


  }
}
