import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../themes/app_theme.dart';
import 'toast_animation.dart';

class ErrorToast {
  static Timer? toastTimer ;
  static OverlayEntry? _overlayEntry;

  static void showCustomToast(
      BuildContext context, String message, String image) {
    if (toastTimer == null || !toastTimer!.isActive) {
      _overlayEntry = createOverlayEntry(context, message, image);
      Overlay.of(context)!.insert(_overlayEntry!);
      toastTimer = Timer(const Duration(seconds: 3), () {
        if (_overlayEntry != null) {_overlayEntry!.remove();}
      });
    }
  }

  static OverlayEntry createOverlayEntry(
      BuildContext context, String message, String image) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0,
        width: MediaQuery.of(context).size.width - 30,
        left: 15,
        child: SlideInToastMessageAnimation(
          Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: getHeightPercentage(context, 8.86699507),
              decoration: BoxDecoration(
                  color: AppTheme.errorToastBg,
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/icons/$image.svg',
                        height: getHeightPercentage(context, 8.86699507),
                        fit: BoxFit.fitHeight,
                        color: Colors.black.withOpacity(0.12),
                        semanticsLabel: 'A red up arrow',
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 13, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          fit: FlexFit.loose,
                          child: Text(
                            message,
                            textAlign: TextAlign.left,
                            softWrap: true,
                            style: TextStyle(
                              fontSize:16.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



class SuccessToast {
  static Timer? toastTimer;
  static OverlayEntry? _overlayEntry;

  static Future<void> showCustomToast(
      BuildContext context, String message, String image) async{
    if (toastTimer == null || !toastTimer!.isActive) {
      _overlayEntry = createOverlayEntry(context, message, image);
      Overlay.of(context)!.insert(_overlayEntry!);
      toastTimer = Timer(Duration(seconds: 3), () {
        if (_overlayEntry != null) {
          _overlayEntry!.remove();
        }
      });
    }
  }

  static OverlayEntry createOverlayEntry(
      BuildContext context, String message, String image) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0,
        width: MediaQuery.of(context).size.width - 30,
        left: 15,
        child: SlideInToastMessageAnimation(Material(
          elevation: 10.0,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: getHeightPercentage(context, 8.86699507),
            decoration: BoxDecoration(
                color: AppTheme.successToastBg,
                borderRadius: BorderRadius.circular(10)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/icons/$image.svg',
                      height: getHeightPercentage(context, 8.86699507),
                      fit: BoxFit.fitHeight,
                      color: Colors.white.withOpacity(0.30),
                      semanticsLabel: 'A red up arrow',
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 13, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          message,
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class MyCustomToast {
  static Timer? toastTimer;
  static OverlayEntry? _overlayEntry;
  static bool isBottom = false;

  static void showCustomToast(
      BuildContext context, String message, String image) {
    if (toastTimer == null || !toastTimer!.isActive) {
      _overlayEntry = createOverlayEntry(context, message, image);
      Overlay.of(context)!.insert(_overlayEntry!);
      toastTimer = Timer(Duration(seconds: 3), () {
        if (_overlayEntry != null) {
          _overlayEntry!.remove();
        }
      });
    }
  }

  static OverlayEntry createOverlayEntry(
      BuildContext context, String message, String image) {
    return OverlayEntry(
      builder: (context) => Positioned(
        bottom: isBottom ? 50 : 110.0,
        width: MediaQuery.of(context).size.width - 40,
        left: 20,
        child: BottomSlideInToastMessageAnimation(Material(
          elevation: 10.0,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            // height: getHeightPercentage(context, 6.5),
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/icons/$image.svg',
                    height: getHeightPercentage(context, 3),
                    fit: BoxFit.fitHeight,
                    color: Colors.white,
                    semanticsLabel: 'A red up arrow',
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      message,
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: (){
                      if (_overlayEntry != null) {
                        toastTimer!.cancel();
                        _overlayEntry!.remove();
                      }
                    },
                    child: SvgPicture.asset(
                      'assets/icons/close.svg',
                      height: getHeightPercentage(context, 2.2),
                      fit: BoxFit.fitHeight,
                      color: Colors.white,
                      semanticsLabel: 'A red up arrow',
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }



}

 double getWidthPercentage(BuildContext context, double percentage) {
return ((MediaQuery.of(context).size.width * percentage) / 100);
}

 double getHeightPercentage(BuildContext context, double percentage) {
return ((MediaQuery.of(context).size.height * percentage) / 100);
}