import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_theme.dart';
import 'inner_shadow.dart';

export 'package:flutter/services.dart' show SmartQuotesType, SmartDashesType;



import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart' as boxInset;


class CustomTextField extends FormField<String> {

  CustomTextField( {
    Key? key,
    this.controller,
    String? initialValue,
    BorderRadius? borderRadius,
    FocusNode? focusNode,
    required bool hasFocus,
    InputDecoration? decoration = const InputDecoration(),
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    StrutStyle? strutStyle,
    Color? bgColor,
    TextDirection? textDirection,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    ToolbarOptions? toolbarOptions,
    bool? showCursor,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool boxShadow = true,
    bool autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    bool isTextArea = false,
    BoxConstraints? constraints,
    @Deprecated(
      'Use autovalidateMode parameter which provide more specific '
          'behaviour related to auto validation. '
          'This feature was deprecated after v1.19.0.',
    )
    bool autovalidate = false,
    @Deprecated(
      'Use maxLengthEnforcement parameter which provides more specific '
          'behavior related to the maxLength limit. '
          'This feature was deprecated after v1.25.0-5.0.pre.',
    )
    bool maxLengthEnforced = true,
    MaxLengthEnforcement? maxLengthEnforcement,
    int? maxLines,
    int? minLines,
    bool expands = false,
    int? maxLength,
    ValueChanged<String>? onChanged,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    double cursorWidth = 2.0,
    double? cursorHeight,
    double? height,
    DecorationImage? decorationImage,
    double? overflowPaddingTop,
    Radius? cursorRadius,
    Color? cursorColor,
    Color? textFieldColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool enableInteractiveSelection = true,
    TextSelectionControls? selectionControls,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    AutovalidateMode? autovalidateMode,
    ScrollController? scrollController,
  }) : assert(initialValue == null || controller == null),
        assert(constraints == null || constraints.debugAssertIsValid()),

        assert(obscuringCharacter.length == 1),
        assert(
        autovalidate == false ||
            autovalidate == true && autovalidateMode == null,
        'autovalidate and autovalidateMode should not be used together.',
        ),
        assert(
        maxLengthEnforced || maxLengthEnforcement == null,
        'maxLengthEnforced is deprecated, use only maxLengthEnforcement',
        ),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
        (maxLines == null) || (minLines == null) || (maxLines >= minLines),
        "minLines can't be greater than maxLines",
        ),
        assert(
        !expands || (maxLines == null && minLines == null),
        'minLines and maxLines must be null when expands is true.',
        ),
        assert(!obscureText || maxLines == 1, 'Obscured fields cannot be multiline.'),
        assert(maxLength == null || maxLength > 0),
        super(
        key: key,
        initialValue: controller != null ? controller.text : (initialValue ?? ''),
        onSaved: onSaved,
        validator: validator,
        enabled: enabled ?? decoration?.enabled ?? true,
        autovalidateMode: autovalidate
            ? AutovalidateMode.always
            : (autovalidateMode ?? AutovalidateMode.disabled),
        builder: (FormFieldState<String> field) {
          final _TextFormFieldState state = field as _TextFormFieldState;
          final InputDecoration effectiveDecoration = (decoration ?? const InputDecoration())
              .applyDefaults(Theme.of(field.context).inputDecorationTheme);
          void onChangedHandler(String value) {
            field.didChange(value);
            if (onChanged != null) {
              onChanged(value);
            }
          }
          return Container(
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){if(!focusNode!.hasFocus) focusNode.requestFocus();},
                  child: Container(
                    padding: EdgeInsets.only(top: 0.sp),
                    height: isTextArea ? null : height,
                    constraints: constraints,
                    alignment: isTextArea ? Alignment.topLeft : Alignment.center,
                    decoration: boxInset.BoxDecoration(
                      color : bgColor ?? Colors.transparent,
                      borderRadius: borderRadius ?? BorderRadius.circular(16.sp),
                      // border: focusNode!.hasFocus  == true ? GradientBorder.uniform(
                      //   width: 1.sp,
                      //   gradient: const LinearGradient(
                      //       colors: <Color>[Color(0xffFF1D6A), Color(0xffFF6E2E),],
                      //       begin: Alignment.centerLeft, end: Alignment.centerRight
                      //   ),
                      // ) : null,
                      boxShadow: boxShadow ? [
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
                      ] : [],
                    ),
                    child: TextField(
                      controller: state._effectiveController,
                      focusNode: focusNode,
                      decoration: effectiveDecoration.copyWith(),
                      keyboardType: keyboardType,
                      textInputAction: textInputAction,
                      style: style,
                      strutStyle: strutStyle,
                      textAlign: textAlign,
                      textAlignVertical: textAlignVertical,
                      textDirection: textDirection,
                      textCapitalization: textCapitalization,
                      autofocus: autofocus,
                      toolbarOptions: toolbarOptions,
                      readOnly: readOnly,
                      showCursor: showCursor,
                      obscuringCharacter: obscuringCharacter,
                      obscureText: obscureText,
                      autocorrect: autocorrect,
                      smartDashesType: smartDashesType ?? (obscureText ? SmartDashesType.disabled : SmartDashesType.enabled),
                      smartQuotesType: smartQuotesType ?? (obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled),
                      enableSuggestions: enableSuggestions,
                      maxLengthEnforcement: maxLengthEnforcement,
                      maxLines: maxLines,
                      minLines: minLines,
                      expands: expands,
                      maxLength: maxLength,
                      onChanged: onChangedHandler,
                      onTap: onTap,
                      onEditingComplete: onEditingComplete,
                      onSubmitted: onFieldSubmitted,
                      inputFormatters: inputFormatters,
                      enabled: enabled ?? decoration?.enabled ?? true,
                      cursorWidth: cursorWidth,
                      cursorHeight: cursorHeight,
                      cursorRadius: cursorRadius,
                      cursorColor: cursorColor,
                      scrollPadding: scrollPadding,
                      scrollPhysics: scrollPhysics,
                      keyboardAppearance: keyboardAppearance,
                      enableInteractiveSelection: enableInteractiveSelection,
                      selectionControls: selectionControls,
                      buildCounter: buildCounter,
                      autofillHints: autofillHints,
                      scrollController: scrollController,
                    ),
                  ),
                ),

                AnimatedCrossFade(
                  firstChild: Container(),
                  secondChild: Container(
                    alignment: Alignment.centerLeft,
                    padding:  EdgeInsets.only(left: 20.sp, top: 6.sp),
                    child: Text("${field.errorText}",
                      style: TextStyle(
                          color: Colors.redAccent, fontSize: 12.sp,height: 1.5, fontFamily: AppTheme.poppins),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  crossFadeState: field.errorText == null ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 200),
                ),

                // field.errorText == null ? Container() : Container(
                //   alignment: Alignment.centerLeft,
                //   padding:  EdgeInsets.only(left: 20.sp, top: 6.sp),
                //   child: Text("${field.errorText}",
                //     style: TextStyle(
                //         color: Colors.redAccent, fontSize: 12.sp,height: 1.5, fontFamily: AppTheme.poppins),
                //     textAlign: TextAlign.left,
                //   ),
                // )
              ],
            ),
          );
        },
      );

  final TextEditingController? controller;

  @override
  _TextFormFieldState createState() => _TextFormFieldState();
}

class _TextFormFieldState extends FormFieldState<String> {
  TextEditingController? _controller;

  TextEditingController? get _effectiveController => widget.controller ?? _controller;

  @override
  CustomTextField get widget => super.widget as CustomTextField;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.initialValue);
    } else {
      widget.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null) {
        _controller = TextEditingController.fromValue(oldWidget.controller!.value);
      }
      if (widget.controller != null) {
        setValue(widget.controller!.text);
        if (oldWidget.controller == null) {
          _controller = null;
        }
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);

    if (_effectiveController!.text != value) {
      _effectiveController!.text = value ?? '';
    }
  }

  @override
  void reset() {

    _effectiveController!.text = widget.initialValue ?? '';
    super.reset();
  }

  void _handleControllerChanged() {
    if (_effectiveController!.text != value) {
      didChange(_effectiveController!.text);
    }
  }
}
