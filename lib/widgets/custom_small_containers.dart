import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_styles.dart';

class CustomSmallContainer extends StatefulWidget {

 bool isSelected;
  String text;

  CustomSmallContainer({Key? key, required this.isSelected, required this.text}) : super(key: key);

  @override
  State<CustomSmallContainer> createState() => _CustomSmallContainerState();
}

class _CustomSmallContainerState extends State<CustomSmallContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(height:44.h ,
      width:88.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: widget.isSelected ? AppStyles.red : AppStyles.white
      ),
      child: Center(child: Text(widget.text, style: widget.isSelected ? AppStyles.buttonstyle.copyWith(fontWeight: FontWeight.w500) : AppStyles.termstyle  )),
    );
  }
}


