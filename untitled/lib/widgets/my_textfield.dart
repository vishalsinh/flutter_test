import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../themes/app_style.dart';
import '../themes/app_theme.dart';
import 'custom_textfield.dart';


class MyTextField extends StatefulWidget {
  final String title;
  final bool enabled;
  final bool showCursor;
  final double? height;
  final double? overFlowTopPadding;
  final String? header;
  final int? maxLength;
  final int maxLines;
  final int? minLines;
  final EdgeInsetsGeometry? underPadding;
  final String? iconData;
  final Widget? prefixIcon;
  final ValueChanged? onChanged;
  final String? errorText;
  final bool obscureText;
  final bool autoValidate;
  final Function(bool)? hasFocus;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final Color? hintTextColor;
  final ValueChanged? onFieldSubmit;
  final GestureTapCallback? onTap;
  final FormFieldSetter<String>? onSaved;
  final Widget? suffixIcon;
  final Color? editTextBgColor;
  final Color? textFieldBgColor;
  final FormFieldValidator? validator;
  final EdgeInsets? contentPadding;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? textController;
  final InputBorder? border;
  final List<TextInputFormatter>? inputFormatters;
  final BorderRadius? borderRadius;
  final bool readyOnly;
  final bool boxShadow;
  final bool isTextArea;
  final bool enableInteractiveSelection;
  final TextStyle? hintStyle;
  final bool caps;
  final double headerTop;
  final double textFieldTop;
  final TextStyle? headerStyle;
  final Color? iconColor;
  final AutovalidateMode? autovalidateMode;



  const  MyTextField({
    Key? key,
    this.iconColor, this.textFieldBgColor,
    required this.title,
    this.header, this.headerStyle,
    this.iconData,
    this.overFlowTopPadding,
    this.hasFocus,
    this.errorText,
    this.focusNode,
    this.textStyle,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.onTap,
    this.onSaved,
    this.autovalidateMode,
    this.minLines,
    this.onFieldSubmit,
    this.contentPadding,
    this.textController,
    this.enabled = true,
    this.textInputAction,
    this.obscureText = false,
    this.autoValidate = false,
    this.editTextBgColor,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.maxLength,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.height = 50,
    this.borderRadius,
    this.readyOnly = false,
    this.enableInteractiveSelection = true,
    this.hintStyle,
    this.showCursor = true,
    this.caps = false,
    this.hintTextColor,
    this.headerTop = 0,
    this.textFieldTop = 0, this.underPadding, this.prefixIcon, this.boxShadow = true, this.border, this.isTextArea = false,
  }) : super(key: key);

  @override
  _MyTextFieldState createState() {
    return _MyTextFieldState();
  }
}

class _MyTextFieldState extends State<MyTextField> {
  bool focusFlag = false;

  @override
  void initState() {
    super.initState();
    if (widget.hasFocus != null) {
      widget.focusNode!.addListener(() {
        widget.hasFocus!(widget.focusNode!.hasFocus);
        setState(() => focusFlag = widget.focusNode!.hasFocus);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        widget.header != null
            ? Padding(
          padding: EdgeInsets.only(
              left: 4.sp,
              bottom: 0, top: widget.headerTop),
          child: Text(
            '${widget.header}',
            style:widget.headerStyle ?? AppStyle.textFieldStyle,
          ),
        )
            : const SizedBox(),
        Container(
          margin: EdgeInsets.only(top: widget.textFieldTop),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            // color:widget.editTextBgColor ?? Colors.blueGrey.withOpacity(0.1),
            color: Colors.transparent,
            borderRadius:  widget.borderRadius ?? BorderRadius.circular(16.sp),
          ),
          child: CustomTextField(
            autocorrect: true,
            hasFocus: focusFlag,
            height: widget.height,
            showCursor: widget.showCursor,
            overflowPaddingTop: widget.overFlowTopPadding,
            enableInteractiveSelection: widget.enableInteractiveSelection,
            textFieldColor: widget.textFieldBgColor ?? Colors.transparent,
            enabled: widget.enabled,
            enableSuggestions: true,
            focusNode: widget.focusNode,
            validator: widget.validator,
            onChanged: widget.onChanged,
            isTextArea: widget.isTextArea,
            maxLength: widget.maxLength,
            minLines:widget.minLines,
            maxLines: widget.isTextArea ? null : 1,
            constraints: widget.isTextArea ? BoxConstraints(
                minHeight: widget.height!
            ) : null,
            obscureText: widget.obscureText,
            autovalidateMode: widget.autovalidateMode,
            controller: widget.textController,
            cursorColor: AppTheme.blue50,
            keyboardType:  widget.keyboardType,
            readOnly: widget.readyOnly,
            onFieldSubmitted: widget.onFieldSubmit,
            boxShadow: widget.boxShadow,
            textInputAction: widget.isTextArea ? TextInputAction.newline: widget.textInputAction,
            inputFormatters: widget.inputFormatters,
            textAlign: widget.textAlign,
            bgColor: widget.editTextBgColor ?? const Color(0xff183351),
            style: widget.textStyle ?? AppStyle.textFieldStyle.copyWith(color: Colors.white),
            textCapitalization: widget.caps ? TextCapitalization.characters : TextCapitalization.sentences,
            onTap: widget.onTap,
            onSaved: widget.onSaved,
            borderRadius: widget.borderRadius ?? BorderRadius.circular(16.sp),
            decoration: InputDecoration(
              focusedBorder: widget.border ?? OutlineInputBorder(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(16.sp),
                borderSide: BorderSide(width: 0.sp, style: BorderStyle.none, color: Colors.transparent),
              ),

              border: widget.border ?? OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(16.sp),

                  borderSide: BorderSide(width: 0.sp, style: BorderStyle.none, color: Colors.transparent)),


              enabledBorder: widget.border ?? OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(16.sp),

                  borderSide: BorderSide(width: 0.sp, style: BorderStyle.none, color: Colors.transparent)),
              errorBorder: widget.border ?? OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(16.sp),

                  borderSide: BorderSide(width: 0.sp, style: BorderStyle.none, color: Colors.transparent)),
              focusedErrorBorder: widget.border ?? OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(16.sp),

                  borderSide: BorderSide(width: 0.sp, style: BorderStyle.none, color: Colors.transparent)),
              disabledBorder: widget.border ?? OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(16.sp),

                  borderSide: BorderSide(width: 0.sp, style: BorderStyle.none, color: Colors.transparent)),

              contentPadding: widget.contentPadding ?? EdgeInsets.only(right: 20,left: widget.iconData != null ? 5 : 16,),
              fillColor: widget.editTextBgColor,
              filled: false,
              hintText: widget.title,
              hintStyle: widget.hintStyle ?? AppStyle.textFieldStyle,
              // hasFloatingPlaceholder: false,
              prefixIcon: widget.prefixIcon ?? (widget.iconData != null ? Align(
                heightFactor: 1.0,widthFactor: 1.0,
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  margin: EdgeInsets.only(left: 10.sp, right: 2.sp),
                  child: SvgPicture.asset(
                    'assets/icons/${widget.iconData}.svg',
                    width: 20.sp,
                    color: widget.iconColor ?? Colors.white,
                  ),
                ),
              )
                  : null),
              suffixIcon: widget.suffixIcon,

              // errorText: widget.errorText,
              errorStyle: const TextStyle(color: Colors.transparent),
            ),
          ),
        ),
      ],
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection,
    );
  }
}
String capitalize(String value) {
  if(value.trim().isEmpty) return "";
  return "${value[0].toUpperCase()}${value.substring(1)}";
}