import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/utils/app_styles.dart';

class CustomTimeContainer extends StatefulWidget {
  String? time;
  bool? isSelected = false;

  CustomTimeContainer({Key? key, required this.time, this.isSelected}) : super(key: key);

  @override
  State<CustomTimeContainer> createState() => _CustomTimeContainerState();
}

class _CustomTimeContainerState extends State<CustomTimeContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          widget.isSelected ==true ? widget.isSelected = false : widget.isSelected = true;
        });
      },
      child: Container(
      height: 22.h,
          width: 77.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
        color: widget.isSelected == true ? AppStyles.black : AppStyles.white,
        border: Border.all(color: widget.isSelected == true ? AppStyles.black : AppStyles.grey.withOpacity(0.20))),
        child: Center(
          child: Text(widget.time!,style: widget.isSelected == true ? AppStyles.buttonstyle.copyWith(fontWeight: FontWeight.w500) : AppStyles.termstyle),
        ),
      ),
    );
  }
}
