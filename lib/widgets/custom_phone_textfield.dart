import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfive/utils/app_styles.dart';

import '../constants/asset_path.dart';
import '../utils/stream_builder.dart';

class CustomPhoneField extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  String hintText;
  String labelText;
  bool readonly;

  final String? format;
  final List<TextInputFormatter>? inputFormatters;

  CustomPhoneField(
      {Key? key,
      this.readonly = false,
      required this.controller,
      required this.type,
      required this.hintText,
      required this.labelText,
      this.format,
      this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: 350.w,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppStyles.grey.withOpacity(0.2))
          // border: Border.all(color: )
          ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.h)
              .copyWith(top: 0.5.h, bottom: 0.5.h),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  showCountryPicker(
                      context: context,
                      //countryFilter: <String>['IN', 'IT'],
                      favorite: <String>['IN'],
                      showPhoneCode: true,
                      onSelect: (Country country) {
                        String countryCode = ' (+${country.phoneCode})';
                        StreamUtil.countrycode.add(country.phoneCode);
                      },
                      // Optional. Sets the theme for the country list picker.
                      countryListTheme: CountryListThemeData(
                        flagSize: 30.0,
                        bottomSheetHeight: 550,
                        textStyle:
                            AppStyles.verifystyle.copyWith(fontSize: 15.sp),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                        // Optional. Styles the search field.
                        inputDecoration: InputDecoration(
                          labelText: 'Search',
                          hintText: 'Start typing to search',
                          prefixIcon: const Icon(Icons.search),
                          fillColor: AppStyles.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xFF8C98A8).withOpacity(0.2),
                              ),
                              borderRadius: BorderRadius.circular(25.0)),
                        ),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        ImageAssetPath.numberIcon,
                      ),
                      SizedBox(width: 19.4.w),
                      StreamBuilder<String>(
                          stream: StreamUtil.countrycode,
                          builder: (context, snapshot) {
                            return Text(
                              '+${snapshot.data!} | ',
                              style: AppStyles.verifystyle
                                  .copyWith(fontSize: 15.sp),
                            );
                          })
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: TextFormField(
                  controller: controller,
                  keyboardType: type,
                  maxLength: 10,
                  textInputAction: TextInputAction.next,
                  readOnly: readonly,
                  inputFormatters: format == 'normal'
                      ? [
                          FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Z]+|\s"),
                          )
                        ]
                      : inputFormatters,
                  style: AppStyles.verifystyle
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    counterText: '',
                    isDense: true,
                    hintText: hintText,
                    hintStyle: AppStyles.termstyle,
                    labelText: labelText,
                    labelStyle: AppStyles.termstyle,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
