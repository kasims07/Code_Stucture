import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/utils/app_styles.dart';

class CustomPriceContainer extends StatefulWidget {
  bool? isSelected;
  String price;
  String name;
 // TextStyle? namestyle;
  //TextStyle pricestyle;

  CustomPriceContainer({Key? key,  required this.isSelected, required this.price, required this.name}) : super(key: key);

  @override
  State<CustomPriceContainer> createState() => _CustomPriceContainerState();
}

class _CustomPriceContainerState extends State<CustomPriceContainer> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
      height: 87.h,
      width: 107.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
       gradient: LinearGradient(begin:Alignment.bottomCenter ,
          end: const Alignment(0.5,0),
          colors: [
            widget.isSelected == true ? AppStyles.red : AppStyles.darkgradient,
            widget.isSelected == true ? AppStyles.red : AppStyles.white
          ]),
        border: Border.all(color: widget.isSelected == true ? AppStyles.red : AppStyles.grey.withOpacity(0.16))
      ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(widget.name, style: widget.isSelected == true ? AppStyles.profilestyle.copyWith(fontSize: 14.sp) : AppStyles.termstyle.copyWith(fontWeight: FontWeight.w600) ),
              //Text(widget.name, style: widget.namestyle ),

             Text('₹ ${widget.price}',style: widget.isSelected == true ? AppStyles.buttonstyle.copyWith(fontSize: 18.sp) : AppStyles.verifystyle.copyWith(fontSize:18.sp) ,)
               //Text('₹ ${widget.price}', style: widget.pricestyle)
          ],),
        ),
    );
  }
}
