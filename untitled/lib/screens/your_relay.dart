import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/validator.dart';
import '../../../widgets/custom_toast/toast.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/my_textfield.dart';

class YourRelay extends StatefulWidget {
  const YourRelay({Key? key}) : super(key: key);

  @override
  _YourRelayState createState() {
    return _YourRelayState();
  }
}

class _YourRelayState extends State<YourRelay> {

  int storyIndex = 0;

  bool currentTabFirst = true;

  final TextEditingController _emailController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutovalidateMode _autoValidate = AutovalidateMode.disabled;


  String title = '';


  bool showSuccess = true;

  int remainingEpisode = 1;

  final _controller = PageController(
    initialPage: 0,
  );


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
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.sp),
          alignment: Alignment.center,
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 52.sp, bottom: 40.sp),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: currentTabFirst ? 'Deine' : 'Sneak-',
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: Colors.white,
                      fontWeight: currentTabFirst ? FontWeight.w500 : FontWeight.w300,
                      fontFamily: AppTheme.inter,
                    ),
                    children: [
                      TextSpan(
                        text:  currentTabFirst ? ' Staffel' : 'Preview',
                        style: const TextStyle(color: AppTheme.green, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 17.sp, right: 17.sp),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _controller.animateToPage(0, duration: const Duration(milliseconds: 400), curve: Curves.ease);
                          setState(() => currentTabFirst = true);
                        },
                        child: Column(
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'Folgen',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppTheme.poppins,
                                ),
                                children: [
                                  TextSpan(
                                    text:  ' (5)',
                                    style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white.withOpacity(.8)),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              height: 2.sp,
                              decoration: BoxDecoration(
                                  color: currentTabFirst ? AppTheme.green : const Color(0xffE3E3E3),
                                  borderRadius: BorderRadius.circular(currentTabFirst ? 10 : 0)
                              ),
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 6.sp),
                            ),

                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child:  GestureDetector(
                        onTap: () {
                          setState(() => currentTabFirst = false);
                          _controller.animateToPage(1, duration: Duration(milliseconds: 400), curve: Curves.ease);
                        },
                        child: Column(
                          children: [

                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: '5-Schritte-Plan',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: AppTheme.poppins,
                                ),
                                children: const [],
                              ),
                            ),

                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 6.sp),
                              height: 2.sp,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(currentTabFirst ? 0 : 10),
                                color: currentTabFirst ? const Color(0xffE3E3E3) : AppTheme.green,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 60.sp, bottom: 33.sp),
                          child: Text(
                            'title',
                            textAlign: TextAlign.center,
                            style:TextStyle(
                                fontSize: 24.sp,
                                height: 1.5,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.blue50,
                                fontFamily: AppTheme.poppins
                            ),
                          ),
                        ),

                        Column(
                          children: List.generate(
                            5, (index) {



                            return GestureDetector(
                              onTap: () {
                                setState(() => storyIndex = index != storyIndex ? index : 10 );
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 16.sp, top: 20.sp, right: 16.sp, bottom: 10.sp),
                                margin: EdgeInsets.only(bottom: 20.sp, left: 6.sp, right: 4.sp),
                                decoration: BoxDecoration(
                                  color: AppTheme.cardColor,
                                  borderRadius: BorderRadius.circular(13.sp),
                                ),
                                child: Column(
                                  children: [

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        GestureDetector(
                                          onTap: () {

                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(12.sp),
                                            margin: EdgeInsets.only(right: 17.sp, top: 2.sp),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 3.sp,
                                                  color: AppTheme.green,
                                                )
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/icons/folgePlay.svg',
                                              width: 24.sp,
                                              height: 24.sp,
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                child: RichText(
                                                  textAlign: TextAlign.left,
                                                  maxLines: 1,
                                                  softWrap: true,
                                                  overflow: TextOverflow.ellipsis,
                                                  text: TextSpan(
                                                    text: 'Folge-${index + 1}',
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        height: 1.5,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.white.withOpacity(.5),
                                                        fontFamily: AppTheme.poppins
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: index == 0 ? '  (gratis)' : '',
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight: FontWeight.w400,
                                                          color: AppTheme.green,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              Container(
                                                margin: EdgeInsets.only(top: 5.sp),
                                                width: double.infinity,
                                                child: Text(
                                                  'audio title ',
                                                  textAlign: TextAlign.left,
                                                  style:TextStyle(
                                                      fontSize: 20.sp,
                                                      height: 1.3,
                                                      fontWeight: FontWeight.w500,
                                                      color: AppTheme.blue50,
                                                      fontFamily: AppTheme.poppins
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),


                                        Container(
                                          margin: EdgeInsets.only(right: 14.sp, left: 12.sp, top: 19.sp),
                                          child: SvgPicture.asset(
                                            index == storyIndex ? 'assets/icons/up.svg' : 'assets/icons/down.svg',
                                            width: 22.sp,
                                            height: 22.sp,
                                          ),
                                        ),


                                      ],
                                    ),

                                    AnimatedCrossFade(
                                      firstChild: Container(
                                        child: Column(
                                          children: [

                                            Container(
                                              margin: EdgeInsets.only(left: 14.sp, right: 12.sp, top: 25.sp),
                                              child: Text(
                                                'desc',
                                                textAlign: TextAlign.left,
                                                style:TextStyle(
                                                    fontSize: 14.sp,
                                                    height: 1.6,
                                                    letterSpacing: 0.6,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white.withOpacity(.8),
                                                    fontFamily: AppTheme.poppins
                                                ),
                                              ),
                                            ),


                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                padding: EdgeInsets.only(right: 26.sp, top: 10.sp, bottom: 10.sp),
                                                width: double.infinity,
                                                child: Text(
                                                  'mehr Infos',
                                                  textAlign: TextAlign.right,
                                                  style:TextStyle(
                                                      fontSize: 16.sp,
                                                      height: 1.5,
                                                      fontWeight: FontWeight.w400,
                                                      color: AppTheme.blue50,
                                                      fontFamily: AppTheme.poppins
                                                  ),
                                                ),
                                              ),
                                            ),


                                          ],
                                        ),
                                      ),
                                      secondChild: const SizedBox(),
                                      crossFadeState: index == storyIndex ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                                      duration: const Duration(milliseconds: 300),
                                      firstCurve: Curves.ease,
                                      sizeCurve: Curves.ease,
                                      secondCurve: Curves.ease,
                                    ),

                                  ],
                                ),
                              ),
                            );
                          },
                          ),
                        ),



                        Container(
                          padding: EdgeInsets.fromLTRB(0, 60.sp, 0, 20.sp),
                          child: Row(
                            children: [

                              Expanded(
                                child: MyButton(
                                    height: 58.sp,
                                    onTap: () {
                                      // Navigator.of(context).pushNamedAndRemoveUntil('homePage', (route) => true);
                                      Navigator.pop(context);
                                    },
                                    loading: false,
                                    btnColor: Colors.transparent,
                                    border: Border.all(color: AppTheme.white, width: 1.5.sp),
                                    child: Text(
                                      'Back',
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontFamily: AppTheme.poppins,
                                      ),
                                    )
                                ),
                              ),

                              SizedBox(width: 20.sp),

                              const Expanded( child: SizedBox()),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }




  updateScreen(bool flag) => setState(() {});




}
