import 'package:bloom_app/presentation/screens/camera_screen.dart';
import 'package:bloom_app/presentation/screens/home_screen.dart';
import 'package:bloom_app/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import '../constants/route_constants.dart';

enum BottomBarEnum {
  home,
  camera,
  profile,
}

extension BottomBarEx on BottomBarEnum {
  String get getIcon {
    switch (this) {
      case BottomBarEnum.home:
        return "assets/icon/home_icon.svg";
      case BottomBarEnum.camera:
        return "";
      case BottomBarEnum.profile:
        return "assets/icon/profile_icon.svg";
    }
  }

  Widget get getScreen {
    switch (this) {
      case BottomBarEnum.home:
        return const HomeScreen();
      case BottomBarEnum.camera:
        return const CameraScreen();
      case BottomBarEnum.profile:
        return const ProfileScreen();
    }
  }

  String get getRouteNames {
    switch (this) {
      case BottomBarEnum.home:
        return RouteDefine.homeScreen;
      case BottomBarEnum.camera:
        return RouteDefine.cameraScreen;
      case BottomBarEnum.profile:
        return RouteDefine.profileScreen;
    }
  }
}
