import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart' as boxInset;

import '../../../themes/app_theme.dart';
import '../../../utils/unfocus_keyboard.dart';
import '../../../utils/validator.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/custom_toast/toast.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/my_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode pwFocusNode = FocusNode();
  final FocusNode confirmPwFocusNode = FocusNode();

  bool isHidePass = true;
  bool isHideConfirmPass = true;

  bool terms = true;


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutovalidateMode _autoValidate = AutovalidateMode.disabled;



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

    return Scaffold(
      backgroundColor: const Color(0xff0A2542),
      body: Column(
        children: [

          MyAppBar(
            tittle: 'Registrierung',
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
                                margin: EdgeInsets.only(top: 45.sp, bottom: 26.sp),
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
                                        textInputAction: TextInputAction.next,
                                        focusNode: pwFocusNode,
                                        validator: (value) => validatePassword(value),
                                        onFieldSubmit: (value){
                                          setState(() {
                                            pwFocusNode.unfocus();
                                            FocusScope.of(context).requestFocus(confirmPwFocusNode);
                                          });
                                        },
                                      ),
                                    ),


                                    GestureDetector(
                                      onTap: () {
                                        keyboardFocus(pwFocusNode);
                                        setState(() => isHidePass = !isHidePass);
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
                                margin: EdgeInsets.only(bottom: 32.sp),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: MyTextField(
                                        height: 59.sp,
                                        title: 'Passcode bestätigen',
                                        iconData: 'lock',
                                        keyboardType: TextInputType.visiblePassword,
                                        textController: _confirmPwController,
                                        obscureText: isHideConfirmPass,
                                        hasFocus: (flag) => updateScreen(flag),
                                        borderRadius:  BorderRadius.circular(100),
                                        textInputAction: TextInputAction.done,
                                        focusNode: confirmPwFocusNode,
                                        validator: (value) => validatePassword(value),
                                        onFieldSubmit: (value){
                                          setState(() {
                                            confirmPwFocusNode.unfocus();
                                            FocusScope.of(context).unfocus();
                                          });
                                        },
                                      ),
                                    ),


                                    GestureDetector(
                                      onTap: () {
                                        keyboardFocus(confirmPwFocusNode);
                                        setState(() => isHideConfirmPass = !isHideConfirmPass);
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
                                          isHideConfirmPass == true ? 'assets/icons/pwHide.svg' : 'assets/icons/pwShow.svg',
                                          height: 28.sp,
                                          width: 28.sp,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                              Container(
                                child: InkWell(
                                  onTap: () => setState(() => terms = !terms),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 5.sp),
                                        child: SvgPicture.asset(terms ? 'assets/icons/check.svg' : 'assets/icons/uncheck.svg', width: 20.sp, height: 20.sp),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 9.sp),
                                          child: RichText(
                                            textAlign: TextAlign.left,
                                            text: TextSpan(
                                              text: 'Wenn ich hier klicke, erkläre ich mich mit den \n',
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                height: 1.6,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                              ),
                                              children: const [
                                                TextSpan(
                                                  text: '"Allgemeinen Geschäftsbedingungen"',
                                                  style: TextStyle(
                                                    color: AppTheme.blue50,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' einverstanden.',
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
                            ],
                          ),

                          const Spacer(),


                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 45.sp),
                                child: MyButton(
                                    height: 59.sp,
                                    onTap: () {},
                                    loading: false,
                                    btnColor: Colors.transparent,
                                    border: Border.all(color: AppTheme.white, width: 1.5.sp),
                                    child: Text(
                                      'Anmeldung ',
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
                                  onTap: (){
                                    Navigator.pushReplacementNamed(context, '/loginScreen');
                                  },
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: 'Sie haben bereits ein Konto? ',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                      children: const [
                                        TextSpan(
                                          text: 'Login',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: AppTheme.blue50,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
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
    );

  }

  updateScreen(bool flag) => setState(() {});



}