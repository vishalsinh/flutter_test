import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../themes/app_theme.dart';
import 'folge_player.dart';
import 'home_page.dart';
import 'your_relay.dart';

class MainScreen extends StatefulWidget {
  final String screenType;
  MainScreen({Key? key, required this.screenType}) : super(key: key);

  @override
  _MainScreenState createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {

  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();



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
    return WillPopScope(
      onWillPop: () async{
          key.currentState!.maybePop();
          return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xff001A36),
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.zero,
          height: 92.sp,
          color: const Color(0xff07223F),
          // color: AppTheme.cardColor,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  key.currentState!.popUntil((route) => route.isFirst);
                },
                child: Container(
                  padding: EdgeInsets.only(top: 5.sp),
                  constraints: BoxConstraints(minWidth: 140.sp),
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Column(
                        children: [

                          Container(
                            width: 33.sp,
                            height: 33.sp,
                            margin: EdgeInsets.only(bottom: 2.sp, top: 13.sp),
                            child: SvgPicture.asset('assets/icons/homeTab.svg'),
                          ),

                          Container(
                            child: Text(
                              'Reisebüro',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppTheme.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppTheme.poppins,
                              ),
                            ),
                          ),

                        ],
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 7.sp, vertical: 3.sp),
                        margin: EdgeInsets.only(right: 8.sp),
                        decoration: const BoxDecoration(
                          color: Color(0xffFF0000),
                          shape: BoxShape.circle
                        ),
                        child: Text(
                          '2',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10.sp,
                            height: 1.6,
                            color: AppTheme.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppTheme.poppins,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/settingsScreen');
                },
                child: Container(
                  padding: EdgeInsets.only(top: 18.sp),
                  constraints: BoxConstraints(minWidth: 140.sp),
                  alignment: Alignment.center,
                  child: Column(
                    children: [

                      Container(
                        width: 33.sp,
                        height: 33.sp,
                        margin: EdgeInsets.only(bottom: 2.sp),
                        child: SvgPicture.asset('assets/icons/SettingsTab.svg'),
                      ),

                      Container(
                        child: Text(
                          'Einstellungen',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppTheme.green,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppTheme.poppins,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Navigator(
          key: key,
          initialRoute: 'mainPage',
          onGenerateInitialRoutes: defaultGenerateInitialRoutes,
          onGenerateRoute: (settings) {
            final args = settings.arguments;

            switch (settings.name) {
              case 'homePage':
                return MaterialPageRoute(builder: (_) => MyProjectsPage());
              case 'yourRelay':
                return MaterialPageRoute(builder: (_) => YourRelay());
              case 'folgePlayer':
                return MaterialPageRoute(builder: (_) => FolgePlayer(), fullscreenDialog: true);
              default:
                Navigator.pushNamed(context, '${settings.name}', arguments: settings.arguments);
            }
          },
        ),
      ),
    );
  }

  List<Route<dynamic>> defaultGenerateInitialRoutes(NavigatorState navigator, String initialRouteName) {

    List<MaterialPageRoute> routes = [];
    routes.add(MaterialPageRoute(builder: (context) => MyProjectsPage()));


    return routes;
  }


}





