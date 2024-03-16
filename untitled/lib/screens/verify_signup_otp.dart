import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../themes/app_style.dart';
import '../../../themes/app_theme.dart';
import '../../../widgets/custom_toast/toast.dart';
import '../../../widgets/my_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../packages/pin_code_fields/lib/pin_code_fields.dart';
import '../widgets/my_icon_btn.dart';

class VerifySignUpOtp extends StatefulWidget {
  final String email;
  const VerifySignUpOtp({Key? key, required this.email}) : super(key: key);

  @override
  _VerifySignUpOtpState createState() {
    return _VerifySignUpOtpState();
  }
}

class _VerifySignUpOtpState extends State<VerifySignUpOtp> {

  final AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  final TextEditingController _otpTextController = TextEditingController();

  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 1);



  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = strDigits(myDuration.inMinutes.remainder(60));
    String seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      backgroundColor: const Color(0xff0A2542),
      body: Column(
        children: [


          Container(
            padding: EdgeInsets.only(bottom: 10.sp, top: MediaQuery.of(context).padding.top + 25.sp ,left: 16.sp,right: 16.sp),
            height: 229.sp,
            decoration: const BoxDecoration(
                color: Color(0xff0A2542),
                image: DecorationImage(image: AssetImage('assets/images/otpBg.png') , fit: BoxFit.fitWidth)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: MyIconButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        icon: 'assets/icons/back.svg',
                        btnColor: Colors.transparent,
                        inkwellBorderRadius: 30.sp,
                      ),
                    ),
                    Container(child: Text('Verification Code',style: AppStyle.appBarTitle,)),
                    Container(
                      child: SizedBox(height: 40.sp, width: 40.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),



          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.sp),
              child: SingleChildScrollView(
                child: Column(
                  children: [


                    Container(
                      margin: EdgeInsets.only(top: 8.sp, bottom: 19.sp),
                      child: Text(
                        'Geben Sie den Verifizierungscode ein, den wir an folgende Adresse geschickt haben ${widget.email}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(.5),
                        ),
                      ),
                    ),



                    Container(
                      margin: EdgeInsets.only(bottom: 10.sp),
                      alignment: Alignment.centerRight,
                      child:  myDuration.inSeconds <= 0  ? InkWell(
                        onTap: () async{
                        },
                        child: Text(
                          'Erneut senden',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.white,
                            fontFamily: AppTheme.poppins,
                          ),
                        ),
                      ) : RichText(
                        textAlign: TextAlign.end,
                        text: TextSpan(
                          text: 'CODE erneut senden',
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.white,
                            fontFamily: AppTheme.poppins,
                          ),
                          children: [
                            TextSpan(
                              text: ' ($minutes:$seconds)',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w300,
                                color: const Color(0xffFFF6FA).withOpacity(.5),
                                fontFamily: AppTheme.poppins,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),




                    Container(
                      margin: EdgeInsets.only(bottom: 83.sp),
                      child: otpTextField(context),
                    ),

                    Container(
                      child: MyButton(
                          height: 59.sp,
                          onTap: () {

                          },
                          loading: false,
                          btnColor: Colors.transparent,
                          border: Border.all(color: AppTheme.white, width: 1.5.sp),
                          child: Text(
                            'Verifizierungscode senden',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: AppTheme.poppins,
                            ),
                          )
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  updateScreen(bool flag) => setState(() {});

  Widget otpTextField(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 5,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      obscureText: false,
      autoDismissKeyboard: true,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        borderWidth: 1.sp,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12.sp),
        fieldHeight: 59.sp,
        fieldWidth: 59.sp,
        activeColor: AppTheme.blue50,
        selectedColor: AppTheme.blue50,
        inactiveColor: Colors.transparent,
        disabledColor: Colors.black,
        activeFillColor: const Color(0xff1A3553),
        selectedFillColor: const Color(0xff1A3553),
        inactiveFillColor: const Color(0xff1A3553),
        errorBorderColor: Colors.black,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      cursorColor: AppTheme.blue50,
      autovalidateMode: _autoValidate,
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 27.sp,
          color: Colors.white),
      controller: _otpTextController,
      onCompleted: (v) {
      },
      onChanged: (value) {
      },
      beforeTextPaste: (text) {
        return true;
      },
    );
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
    setState(() {

    });
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    setState(() => myDuration = const Duration(minutes: 1));

  }

  void setCountDown() {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });


  }


}