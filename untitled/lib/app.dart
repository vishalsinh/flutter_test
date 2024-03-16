import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/screens/login_screen.dart';
import 'package:untitled/themes/app_theme.dart';


class MyAPp extends StatefulWidget {
  const MyAPp({Key? key}) : super(key: key);

  @override
  _TriggerCoachState createState() {
    return _TriggerCoachState();
  }
}

class _TriggerCoachState extends State<MyAPp>  with WidgetsBindingObserver{
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print("CALL INIT STATE APP");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context,child) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          title: 'Trigger Coach',
          home: LoginScreen(),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightThemeData,
        ),
      ),
    );
  }
}