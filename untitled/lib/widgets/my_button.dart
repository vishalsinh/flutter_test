import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_style.dart';

class MyButton extends StatefulWidget {
   double? width;
   double? height;
   final String? title;
   final Widget? child;
   final Color? bgColor;
   final Color? btnColor;
   final Color? iconColor;
   final Color? splashColor;
   final Gradient? linearColor;
   bool loading = false;
   final TextStyle? textStyle;
   final EdgeInsetsGeometry? margin;
   final EdgeInsetsGeometry? padding;
   final GestureTapCallback onTap;
   final BoxBorder? border;
   final BorderRadiusGeometry? borderRadius;


   MyButton({
     Key? key,
     this.title,
     this.child,
     this.btnColor,
     this.splashColor,
     required this.onTap,
     this.textStyle,
     this.margin,
     this.width,
     this.height = 60,
     this.bgColor,
     this.linearColor,
     this.padding,
     required this.loading,
     this.iconColor,
     this.border,
     this.borderRadius ,}) : super(key: key);

  @override
  _MyButtonState createState() {
    return _MyButtonState();
  }
}

class _MyButtonState extends State<MyButton> {



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
    
    return Container(
      height: widget.height?.sp,
      width: widget.width ?? double.infinity,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: widget.btnColor,
        gradient: widget.linearColor,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(80.sp),
        border: widget.border
      ),
      child: ButtonTheme(
        padding: widget.padding,
        buttonColor: widget.bgColor ?? Colors.transparent,
        child: MaterialButton(
          colorBrightness: Brightness.light,
          hoverColor: Colors.red,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.sp)),
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          splashColor: widget.splashColor,
          highlightElevation: 0,
          onPressed : () {
            if(!widget.loading){
              HapticFeedback.lightImpact();
              widget.onTap();
            }
          },
          child :widget.loading == true ? Center(
            child: Container(
                height: 20.sp,
                width: 20.sp,
                child: const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 2.0,
                  ),
                )),
          ) : widget.child ?? Text('${widget.title}', style: widget.textStyle ?? AppStyle.btnTextStyle ) ,
        ),
      ),
    );
  }
}

