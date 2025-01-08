import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_inspector/network_inspector.dart';
import 'package:provider/provider.dart';

import 'helpers/navigator/go_to.dart';
import 'managers/headers/headers_manager.dart';
import 'managers/provider_setup/providers_setup.dart';
import 'managers/theme/app_theme_manager.dart';
import 'modules/splash/view/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NetworkInspector.initialize();
  HeadersManager.instance.configure();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        child: MaterialApp(
          theme: appThemeManager(),
          debugShowCheckedModeBanner: false,
          navigatorKey: GoTo.navigationKey,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}

