import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gfive/app_screens/app_screens.dart';
import 'package:gfive/utils/app_styles.dart';
import 'package:gfive/widgets/loading_container.dart';

import '../../api_client/api_constans.dart';
import '../../constants/asset_path.dart';
import '../../utils/alert_utils.dart';
import '../../utils/app_utils.dart';
import '../../utils/stream_builder.dart';
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

  Datum? firstData;
  List<Datum> catagorys = [];

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
      StreamUtil.username.add( homedata!.user!.name!);
      StreamUtil.mobilenumber.add(homedata!.user!.phoneNumber!);
      StreamUtil.email.add(homedata!.user!.email!);
      StreamUtil.profileurl.add(homedata!.user!.userimage!);
      for(int i = 0; i<homedata!.data!.length; i++){
        if(i == 0){
          firstData = homedata!.data![i];
        }else{
          catagorys.add(homedata!.data![i]);
        }
      }
      print('FIRST DATA NAME = ${firstData!.category}');
      for(int i = 0; i<catagorys.length; i++){
        print('Catagory name ${i} = ${catagorys[i].category}');
      }

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
                          StreamUtil.categoryname.add(firstData!.category!);
                          StreamUtil.categoryid.add(firstData!.id!);
                          Navigator.pushNamed(context, AppScreens.serviceDetails, arguments:{'categoryid':firstData!.id});
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
                                  child: Image.network('${APIConstants.imageUrl}${firstData!.image}', height: 145.h, width: 372.w)),
                              Positioned(
                                  top: 15,
                                  right:30,
                                  child: Text('${firstData!.category}',style: AppStyles.homelogostyle ,))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: GridView.builder(
                          shrinkWrap: true,
                            itemCount: catagorys.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              crossAxisSpacing: 10
                            ),
                            itemBuilder: (context, indext){
                          return InkWell(
                            onTap: (){
                              StreamUtil.categoryname.add(catagorys[indext].category!);
                              StreamUtil.categoryid.add(catagorys[indext].id!);
                              Navigator.pushNamed(context, AppScreens.serviceDetails, arguments:{'categoryid':catagorys[indext].id});
                            },
                            child: CustomContainer(
                              text: catagorys[indext].category!,
                              imagePath: '${APIConstants.imageUrl}${catagorys[indext].image}',
                              imageHeight: 74.h,
                              imageWidth: 82.w,
                              topPadding: 2.h,
                              botPadding: 3.h,

                            ),
                          );
                        }, )
                      ),
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
