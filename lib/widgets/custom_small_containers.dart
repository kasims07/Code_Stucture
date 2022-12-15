import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_styles.dart';

class CustomSmallContainer extends StatefulWidget {
  bool selectedbool ;
  String text;

  CustomSmallContainer({Key? key, required this.selectedbool, required this.text}) : super(key: key);

  @override
  State<CustomSmallContainer> createState() => _CustomSmallContainerState();
}

class _CustomSmallContainerState extends State<CustomSmallContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       setState(() {
         widget.selectedbool ==true ? widget.selectedbool = false : widget.selectedbool = true;
       });

      },
      child: Container(height:44.h ,
        width:88.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.selectedbool ? AppStyles.red : AppStyles.white
        ),
        child: Center(child: Text(widget.text, style: widget.selectedbool ? AppStyles.buttonstyle.copyWith(fontWeight: FontWeight.w500) : AppStyles.termstyle  )),
      ),
    );
  }
}


