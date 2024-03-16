
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';


List<BoxShadow> innerShadow(){

  return [
    BoxShadow(
      offset: Offset(-3, -3),
      blurRadius: 6,
      color: Colors.white.withOpacity(0.5),
      inset: true,
    ),
    // BoxShadow(
    //   offset: Offset(20, 20),
    //   blurRadius: 60,
    //   color: Color(0xFFBEBEBE),
    //   inset: true,
    // ),
  ];
}