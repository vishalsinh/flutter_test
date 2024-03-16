import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../themes/app_theme.dart';

class MyIconButton extends StatefulWidget {
  double? width;
  double? height;
  double? widthIcon;
  double? heightIcon;
  final String icon;
  final GestureTapCallback onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? innerPadding;
  final BorderRadiusGeometry? borderRadius;
  final double? inkwellBorderRadius;
  final BorderSide? side;
  final double? radius;
  final Color? btnColor;
  final Color? splashColor;
  Color? iconColor;
  final Gradient? gradient;
  Color? borderColor;
  final List<BoxShadow>? boxShadow;


  MyIconButton({Key? key,
    this.side,
    this.width,
    this.radius,
    this.height,
    this.margin,
    this.padding,
    this.gradient,
    this.btnColor,
    this.splashColor,
    this.boxShadow,
    this.iconColor,
    this.borderColor,
    this.borderRadius,
    this.innerPadding,
    this.heightIcon,
    this.widthIcon,
    required this.icon,
    required this.onTap,
    this.inkwellBorderRadius,
  }) : super(key: key);

  @override
  _MyIconButtonState createState() {
    return _MyIconButtonState();
  }
}

class _MyIconButtonState extends State<MyIconButton> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      child: Container(
        height: widget.height ?? 40.sp,
        width: widget.width ?? 40.sp,
        margin: widget.margin,

        decoration: BoxDecoration(
            color: widget.btnColor ?? AppTheme.blue50,
            gradient: widget.gradient,
            borderRadius: widget.borderRadius,
            border: Border.all(color: widget.borderColor ?? Colors.transparent),
            shape: BoxShape.circle,
            boxShadow: widget.boxShadow),
        child: ButtonTheme(
          splashColor: widget.splashColor ?? AppTheme.blue50,
          child: OutlinedButton(
            onPressed: widget.onTap,
            style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
                primary: widget.splashColor ?? AppTheme.white,
                side: const BorderSide(color: Colors.transparent),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.inkwellBorderRadius ?? 80.sp),
                )),
            child: Container(
              padding: widget.innerPadding ?? EdgeInsets.all(2.sp),
              child: SvgPicture.asset(widget.icon, color: widget.iconColor,height: widget.heightIcon ?? 38.sp,
                width: widget.widthIcon ?? 38.sp,),
            ),
          ),
        ),
      ),
    );
  }
}