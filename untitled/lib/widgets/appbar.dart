import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_style.dart';

class MyAppBar extends StatefulWidget {

  final Widget? leftIcon;
  final Color? bgColor;
  final bool? textVisible ;
  final Widget? rightIcon;
  final String? tittle;
  final TextStyle? style;
  final List<BoxShadow>? boxShadow;
  MyAppBar({Key? key, this.leftIcon, this.textVisible, this.rightIcon, this.tittle, this.style, this.boxShadow, this.bgColor}) : super(key: key);

  @override
  _MyAppBarState createState() {
    return _MyAppBarState();
  }
}

class _MyAppBarState extends State<MyAppBar> {
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
      padding: EdgeInsets.only(bottom: 10.sp, top: MediaQuery.of(context).padding.top + 25.sp ,left: 25.sp,right: 25.sp),
      decoration: BoxDecoration(
          boxShadow: widget.boxShadow,
        color: widget.bgColor ?? Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: widget.leftIcon ?? SizedBox(height: 40.sp, width: 40.sp),
          ),
          Container(child: widget.textVisible == true ? Text(widget.tittle ?? '',style: widget.style ?? AppStyle.appBarTitle,) : Container()),
          Container(
            child: widget.rightIcon ?? SizedBox(height: 40.sp, width: 40.sp),
          ),
        ],
      ),
    );
  }
}