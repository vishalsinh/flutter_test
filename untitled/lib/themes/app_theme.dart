import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class AppTheme {
 AppTheme._();

  static const Color bgColor = Color(0xFF001A36);
  static const Color primaryColor = Color(0xFFFD1933);
  static const Color secondaryColor = Color(0xFF084FF8);

  static const Color scaffoldColor = Color(0xFF0A2542);
  static const Color cardColor = Color(0xFF1A3553);
  static const Color shimmer = Color(0xff1D3B5B);
  static const Color dialogColor = Color(0xFF134369);
  static const Color pinkColor = Color(0xffEF6A97);
  static const Color orangeColor = Color(0xffD4761F);

  static const Color blue50 = Color(0xFF34A8FF);
  static const Color blue40 = Color(0xFFA2D7FF);
  static const Color blue30 = Color(0xFFD9EFFF);


  static const Color green = Color(0xFF1DBF73);



  static const Color white = Color(0xFFFFFFFF);
  static const Color textColor = Color(0xFF1C274C);

  static const Color textFieldBg = Colors.transparent;
  static const Color textFieldHint = Color(0xFF9CA4AB);
  static const Color textFieldBorder = Color(0xFFE3E7EC);

  static const Color remaining = Color(0xFF7E7E7E);

  static const Color grey = Color(0xFF95969D);
  static const Color disable = Color(0xFF9B9B9B);
  static const Color grey10 = Color(0xFFB9B9B9);
  static const Color grey20 = Color(0xFF828282);
  static const Color black = Color(0xFF212121);


  static const Color darkBottomDrawer = Color(0xFF212427);
  static const Color lightBottomDrawer = Color(0xFFFCFCFD);

 static const Color successToastBg = Color(0xff11B868);
 static const Color errorToastBg = Color(0xffE01212);


 static List<Color> primaryGradient = [
   const Color(0xFF084FF8),
   const Color(0xFF3682FD),
 ];


 // ----------------------------------------------------------------------------




 static final Color focusColor = Colors.black.withOpacity(0.12);



 static const String poppins = 'Poppins';
 static const String inter = 'Inter';


  static double appBarHeight = AppBar().preferredSize.height;
  static double appBarWidth = AppBar().preferredSize.height + 40;




  static ThemeData lightThemeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    focusColor: focusColor,
    cardColor: Colors.white,
    backgroundColor: Colors.white,
    // hintColor: grey60,
    // errorColor: errorColor,
    fontFamily: poppins,
    platform: TargetPlatform.iOS,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: scaffoldColor,
    splashColor: focusColor,
  );

}
