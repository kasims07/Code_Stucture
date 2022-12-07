import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfive/constants/asset_path.dart';
import 'package:gfive/utils/app_styles.dart';

import '../utils/stream_builder.dart';

class DashboardBottombar extends StatefulWidget {
  const DashboardBottombar({Key? key}) : super(key: key);

  @override
  State<DashboardBottombar> createState() => _DashboardBottombarState();
}

class _DashboardBottombarState extends State<DashboardBottombar> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: StreamUtil.bottombar,
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.all(10.h),
          height: 70.h,
          color : AppStyles.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             InkWell(
               onTap: (){
                 StreamUtil.bottombar.add(0);
                 print( StreamUtil.bottombar.value);
               },
               child: Column(
                 children: [
                   SvgPicture.asset( snapshot.data == 0 ? ImageAssetPath.redhome : ImageAssetPath.homeIcon,height: 30.h,width: 30.h,),
                   Text('Home', style:AppStyles.termstyle.copyWith(fontSize: 14.sp,color: snapshot.data == 0 ? AppStyles.red  : AppStyles.bottomnavigationcolor) ,)
                 ],
               ),
             ),
              InkWell(
                onTap: (){
                  StreamUtil.bottombar.add(1);
                  print(StreamUtil.bottombar.value);
                },
                child: Column(
                  children: [
                    SvgPicture.asset( snapshot.data == 1 ? ImageAssetPath.redbooking : ImageAssetPath.booking,height: 30.h,width: 30.h,),
                    Text('My Booking', style:AppStyles.termstyle.copyWith(fontSize: 14.sp,color: snapshot.data == 1 ? AppStyles.red : AppStyles.bottomnavigationcolor ) ,)
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  StreamUtil.bottombar.add(2);
                  print(StreamUtil.bottombar.value);
                },
                child: Column(
                  children: [
                    SvgPicture.asset(snapshot.data == 2 ? ImageAssetPath.rednoteIcon :  ImageAssetPath.noteIcon ,height: 30.h,width: 30.h,),
                    Text('Notifications', style:AppStyles.termstyle.copyWith(fontSize: 14.sp,color: snapshot.data == 2 ? AppStyles.red : AppStyles.bottomnavigationcolor ) ,)
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  StreamUtil.bottombar.add(3);
                  print(StreamUtil.bottombar.value);
                },
                child: Column(
                  children: [
                    SvgPicture.asset(snapshot.data == 3 ? ImageAssetPath.redAccount : ImageAssetPath.account,height: 30.h,width: 30.h,),
                    Text('Account', style:AppStyles.termstyle.copyWith(fontSize: 14.sp,color: snapshot.data == 3 ? AppStyles.red : AppStyles.bottomnavigationcolor ) ,)
                  ],
                ),
              )
            ],
          ),

        );
      }
    );
  }
}
