import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import 'app_theme.dart';

class AppStyle {

  static TextStyle authTitle =  TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: AppTheme.inter,
    color: AppTheme.white,
    fontSize: 24.sp,
  );

  static TextStyle textFieldHint =  TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: AppTheme.inter,
    color: AppTheme.textFieldHint,
    fontSize: 16.sp,
  );

  static TextStyle textField =  TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: AppTheme.inter,
    color: AppTheme.white,
    fontSize: 16.sp,
  );

  static TextStyle text4 =  TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: AppTheme.inter,
    color: AppTheme.white,
    fontSize: 16.sp,
  );

  static TextStyle btnTextStyle =  TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontFamily: AppTheme.inter,
  );

  static TextStyle text5 =  TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: AppTheme.inter,
    color: AppTheme.white,
    fontSize: 13.sp,
  );



  // -------------------------------------------------------------


  static TextStyle onBoardTitle = TextStyle(
      color: AppTheme.white,
      fontFamily: AppTheme.poppins,
      fontWeight: FontWeight.w500,
      fontSize: 24.sp);

  static TextStyle onBoardSubTitle = TextStyle(
      color: AppTheme.white,
      fontFamily: AppTheme.poppins,
      fontWeight: FontWeight.w500,
      fontSize: 14.sp);


  static TextStyle appBarTitle = TextStyle(
      color: AppTheme.white,
      fontFamily: AppTheme.poppins,
      fontWeight: FontWeight.w500,
      fontSize: 18.sp);

  static TextStyle textFieldStyle = TextStyle(
      color: AppTheme.white.withOpacity(0.6),
      fontFamily: AppTheme.poppins,
      fontWeight: FontWeight.w400,
      height: 1.8,
      fontSize: 15.sp);


}