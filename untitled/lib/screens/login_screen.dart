import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/unfocus_keyboard.dart';
import '../../../utils/validator.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/my_textfield.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart' as boxInset;
import 'package:flutter/foundation.dart';
import '../../../widgets/my_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_toast/toast.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

const List<String> scopes = <String>[
  'id'
  'email',
  'name'
];


class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode pwFocusNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  bool isHidePass = true;

  bool terms = true;



  @override
  void initState() {
    super.initState();
    // SuccessToast.showCustomToast(context,  "Success Msg", "toast_success");
    // ErrorToast.showCustomToast(context,  "Error Msg", "toast_information");


  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            MyAppBar(
              tittle: 'Login',
              textVisible: true,
            ),

            Expanded(
              child: Form(
                key: _formKey,
                autovalidateMode: _autoValidate,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.sp),
                  child: CustomScrollView(
                    scrollDirection: Axis.vertical,
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            const Spacer(),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [


                                Container(
                                  margin: EdgeInsets.only(top: 45.sp, left: 57.sp, right: 57.sp, bottom: 39.sp),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      InkWell(
                                        onTap: (){

                                        },
                                        child: Image.asset(
                                          'assets/icons/google.png',
                                          height: 60.sp,
                                          width: 60.sp,
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        'assets/icons/facebook.svg',
                                        height: 60.sp,
                                        width: 60.sp,
                                      ),
                                      InkWell(
                                        onTap: (){},
                                        child: SvgPicture.asset(
                                          'assets/icons/apple.svg',
                                          height: 60.sp,
                                          width: 60.sp,
                                        ),
                                      ),


                                    ],
                                  ),
                                ),

                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(horizontal: 65.sp),
                                  margin: EdgeInsets.only(bottom: 37.sp),
                                  child: SvgPicture.asset('assets/images/or.svg', fit: BoxFit.fitWidth),
                                ),


                                Container(
                                  margin: EdgeInsets.only(bottom: 26.sp),
                                  child: MyTextField(
                                    height: 59.sp,
                                    title: 'Name (Alias Name)',
                                    iconData: 'user',
                                    textController: _nameController,
                                    hasFocus: (flag) => updateScreen(flag),
                                    borderRadius:  BorderRadius.circular(100),
                                    inputFormatters: [UpperCaseTextFormatter()],
                                    textInputAction: TextInputAction.next,
                                    focusNode: nameFocusNode,
                                    validator: (value) => validateName(value),
                                    onFieldSubmit: (value){
                                      setState(() {
                                        nameFocusNode.unfocus();
                                        FocusScope.of(context).requestFocus(emailFocusNode);
                                      });
                                    },
                                  ),
                                ),




                                Container(
                                  margin: EdgeInsets.only(bottom: 26.sp),
                                  child: MyTextField(
                                    height: 59.sp,
                                    title: 'E-Mail Adresse',
                                    iconData: 'email',
                                    keyboardType: TextInputType.emailAddress,
                                    textController: _emailController,
                                    hasFocus: (flag) => updateScreen(flag),
                                    borderRadius:  BorderRadius.circular(100),
                                    textInputAction: TextInputAction.next,
                                    focusNode: emailFocusNode,
                                    validator: (value) => validateEmail(value),
                                    onFieldSubmit: (value){
                                      setState(() {
                                        emailFocusNode.unfocus();
                                        FocusScope.of(context).requestFocus(pwFocusNode);
                                      });
                                    },
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(bottom: 32.sp),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: MyTextField(
                                          height: 59.sp,
                                          title: 'Passwort',
                                          iconData: 'lock',
                                          keyboardType: TextInputType.visiblePassword,
                                          textController: _pwController,
                                          obscureText: isHidePass,
                                          hasFocus: (flag) => updateScreen(flag),
                                          borderRadius:  BorderRadius.circular(100),
                                          textInputAction: TextInputAction.done,
                                          focusNode: pwFocusNode,
                                          validator: (value) => validatePassword(value),
                                          onFieldSubmit: (value){
                                            setState(() {
                                              pwFocusNode.unfocus();
                                              FocusScope.of(context).unfocus();
                                            });
                                          },
                                        ),
                                      ),


                                      GestureDetector(
                                        onTap: () {
                                          keyboardFocus(pwFocusNode);
                                          if (isHidePass == true) {
                                            setState(() {
                                              isHidePass = false;
                                            });
                                          } else {
                                            setState(() {
                                              isHidePass = true;
                                            });
                                          }
                                        },
                                        child: Container(
                                          height: 58.sp,
                                          width: 58.sp,
                                          decoration: boxInset.BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: const Color(0xff183351),
                                            boxShadow: [
                                              boxInset.BoxShadow(
                                                offset: Offset(3.sp, 3.sp),
                                                blurRadius: 6.sp,
                                                color: Colors.white.withOpacity(0.16),
                                                inset: true,
                                              ),
                                              boxInset.BoxShadow(
                                                offset: Offset(3.sp, 3.sp),
                                                blurRadius: 6.sp,
                                                color: Colors.black.withOpacity(0.16),
                                              ),
                                            ],
                                          ),
                                          padding: EdgeInsets.all(18.sp),
                                          margin: EdgeInsets.only(left: 10.5.sp),
                                          child: SvgPicture.asset(
                                            isHidePass == true ? 'assets/icons/pwHide.svg' : 'assets/icons/pwShow.svg',
                                            height: 28.sp,
                                            width: 28.sp,
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),

                                Container(
                                  child: Row(
                                    children: [

                                      InkWell(
                                        onTap: () => setState(() => terms = !terms),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(terms ? 'assets/icons/check.svg' : 'assets/icons/uncheck.svg', width: 20.sp, height: 20.sp),
                                            Container(
                                              margin: EdgeInsets.only(left: 9.sp),
                                              child: Text(
                                                'Erinnere mich',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    color: AppTheme.white,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),



                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(context, '/forgotPassword');
                                          },
                                          child: Text(
                                            'Passwort vergessen ?',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: AppTheme.blue50,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const Spacer(),


                            Column(
                              children: [

                                Container(
                                  padding: EdgeInsets.only(top: 45.sp),
                                  child: MyButton(
                                      height: 59.sp,
                                      onTap: () {

                                      },
                                      loading: false,
                                      btnColor: Colors.transparent,
                                      border: Border.all(color: AppTheme.white, width: 1.5.sp),
                                      child: Text(
                                        'Login ',
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
                                Container(
                                  margin: EdgeInsets.only(bottom: 46.sp, top: 64.sp),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(context, '/signUpScreen');
                                    },
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: 'Sie haben noch kein Konto? ',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                        children: const [
                                          TextSpan(
                                            text: 'REGISTRIEREN',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: AppTheme.blue50,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),




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
    );
  }

  updateScreen(bool flag) => setState(() {});

}