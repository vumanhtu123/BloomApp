import 'package:bloom_app/app/constants/route_constants.dart';
import 'package:bloom_app/app/utils/screen_until.dart';
import 'package:bloom_app/presentation/screens/camera_screen.dart';
import 'package:bloom_app/presentation/screens/home_screen.dart';
import 'package:bloom_app/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../presentation/screens/bottom_bar_screen.dart';
import '../../presentation/screens/splash_screen.dart';

class Routes {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> bottomBarNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> homeKey = GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> historyScanKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> scanKey = GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> newsKey = GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> personalKey =
      GlobalKey<NavigatorState>();

  factory Routes() => _instance;

  Routes._internal();

  static final Routes _instance = Routes._internal();

  static Routes get instance => _instance;

  Future<dynamic> navigateAndRemove(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  static Route<dynamic> generateDefaultRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteDefine.splashScreen:
        return SlideLeftRoute(
          widget: const SplashScreen(),
        );
      case RouteDefine.bottomBarScreen:
        return SlideLeftRoute(
          widget: const BottomBarScreen(),
        );
      case RouteDefine.profileScreen:
        return SlideLeftRoute(
          widget: const ProfileScreen(
              // userId:
              //     settings.arguments != null ? settings.arguments as String : '',
              ),
        );

      case RouteDefine.cameraScreen:
        return SlideUpRoute(
          widget: const CameraScreen(
              // userId:
              //     settings.arguments != null ? settings.arguments as String : '',
              ),
        );

      case RouteDefine.homeScreen:
        return SlideUpRoute(
          widget: const HomeScreen(
              // userId:
              //     settings.arguments != null ? settings.arguments as String : '',
              ),
        );
      default:
        return _emptyRoute(settings);
    }
  }

  static MaterialPageRoute _emptyRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Center(
              child: Text(
                'Back',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        body: Center(
          child: Text('No path for ${settings.name}'),
        ),
      ),
    );
  }
}
