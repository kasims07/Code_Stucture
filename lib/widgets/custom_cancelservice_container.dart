import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/utils/app_styles.dart';

class CustomCancelServiceContainer extends StatefulWidget {
  String text;
  bool? isCancelselected = false;

  CustomCancelServiceContainer({Key? key, required this.text, this.isCancelselected}) : super(key: key);

  @override
  State<CustomCancelServiceContainer> createState() => _CustomCancelServiceContainerState();
}

class _CustomCancelServiceContainerState extends State<CustomCancelServiceContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          widget.isCancelselected == true ? widget.isCancelselected = false : widget.isCancelselected = true;
        });
      },
      child: Container(
        height: 50.h,
        width:318.w,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
          color: widget.isCancelselected == true ? AppStyles.black : AppStyles.servicecontainercolor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            widget.text, style: widget.isCancelselected == true ?  AppStyles.buttonstyle : AppStyles.termstyle),
          ),
        ),
    );

  }
}
