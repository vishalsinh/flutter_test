import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../themes/app_theme.dart';
import '../../../widgets/custom_toast/toast.dart';
import '../../../widgets/my_button.dart';

class MyProjectsPage extends StatefulWidget {
  MyProjectsPage({Key? key}) : super(key: key);

  @override
  _MyProjectsPageState createState() {
    return _MyProjectsPageState();
  }
}


class _MyProjectsPageState extends State<MyProjectsPage> {




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
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          alignment: Alignment.center,
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 52.sp),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Dein\n',
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppTheme.inter,
                    ),
                    children: const [
                      TextSpan(
                        text:  'Reise-Archiv',
                        style: TextStyle(color: AppTheme.green),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 14.sp, bottom: 6.sp),
                child: Image.asset(
                  'assets/icons/headphone.png',
                  height: 52.sp,
                  fit: BoxFit.fitHeight,
                ),
              ),


              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 20.sp),
                  itemCount: 2,
                  itemBuilder: (context, index){

                    if(1 == index){
                      return GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          padding: EdgeInsets.all(32.sp),
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 12.sp),
                          decoration: BoxDecoration(
                            color: AppTheme.cardColor,
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          child:Text(
                            'Neue Mentalreise erstellen',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.sp,
                              height: 1.5,
                              color: AppTheme.green,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppTheme.poppins,
                            ),
                          ),
                        ),
                      );
                    } else{

                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'yourRelay', arguments: index),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(40.sp, 24.sp, 20.sp, 24.sp),
                          margin: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 12.sp),
                          decoration: BoxDecoration(
                            color: AppTheme.cardColor,
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          child:Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'title',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    height: 1.5,
                                    color: Colors.white.withOpacity(.8),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppTheme.poppins,
                                  ),
                                ),
                              ),

                              GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/listMenu.svg',
                                  height: 40.sp,
                                  width: 40.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }

                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }




}