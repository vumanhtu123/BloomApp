import 'package:bloom_app/app/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'app/constants/route_constants.dart';
import 'app/di/dependency_injection.dart';
import 'app/themes/colors.dart';
import 'app/utils/screen_until.dart';
import 'presentation/viewmodels/user_profile_viewmodel.dart';

void main() {
  setupDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => injector<UserViewModel>(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: Routes.instance.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Bloom App',
        onGenerateRoute: Routes.generateDefaultRoute,
        initialRoute: RouteDefine.splashScreen,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          fontFamily: 'Montserrat',
          scaffoldBackgroundColor: AppColors.secondaryColor,
        ),
        builder: (context, widget) {
          return ScreenUtilInit(builder: (context, child) {
            GScreenUtil.init(context);
            return Scaffold(
                resizeToAvoidBottomInset: false,
                body: widget ?? const SizedBox());
          });
        },
      ),
    );
  }
}
