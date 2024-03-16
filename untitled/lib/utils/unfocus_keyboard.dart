import 'package:flutter/src/widgets/focus_manager.dart';

keyboardFocus(FocusNode focusNode) {
  focusNode.unfocus();
  focusNode.canRequestFocus = false;

  Future.delayed(const Duration(milliseconds: 100), () {
    focusNode.canRequestFocus = true;
  });
}
