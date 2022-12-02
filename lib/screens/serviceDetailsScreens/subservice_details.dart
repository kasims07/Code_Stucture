import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gfive/utils/app_styles.dart';
import 'package:rxdart/rxdart.dart';

import '../../constants/asset_path.dart';
import '../../widgets/custom_price_container.dart';

class SubserviceDetails extends StatelessWidget {

   SubserviceDetails({Key? key}) : super(key: key);

  List<String> pricelist = ['100', '200', '300','400','500'];
  List<String> namelist = ['1BHK', '2BHK', '3BHK', '4BHK', '5BHK'];



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
              child: Padding(padding: EdgeInsets.only(top:63),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: (){},
                        icon: SvgPicture.asset(ImageAssetPath.backIcon, width:12.62.w )
                    ),
                  ),
                  Text('Unfurnished Appartment Classic\nCleaning', textAlign: TextAlign.center, style:AppStyles.profilestyle),
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
                  child: Column(children: [
                    Text(textAlign: TextAlign.left, 'Maecenas sed diam eget risus varius blandit sit\namet non magna. Integer posuere erat a ante\nvenenatis dapibus posuere velit aliquet.Maecenas\nsed diam eget risus varius blandit sit amet non' , style: AppStyles.detailsstyle,),
                    Row(
                      children: [
                        Text('   Readmore', style: AppStyles.detfontstyle),
                        SizedBox(width: 6.67.w),
                        SvgPicture.asset(ImageAssetPath.downarrowIcon,height: 6.h,width:10.67.w ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(color:AppStyles.divider,thickness: 1),
                    SizedBox(height: 15),
                    Text('Service Price List',textAlign:TextAlign.left, style:AppStyles.detfontstyle.copyWith(fontWeight: FontWeight.w600)),
                     Expanded(
                       child: GridView.builder(
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
