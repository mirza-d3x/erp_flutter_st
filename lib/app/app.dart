// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../constants/theme/custom_theme.dart';
import '../services/navigation_services/navigation.dart';
import '../services/service_locator.dart';
import '../utils/app_theme.dart';

class Root extends StatelessWidget {
  const Root({
    // required this.appThemeMode,
    required this.app,
    super.key,
    required this.serviceLocator,
  });

  // final AppThemeMode appThemeMode;
  final YearApp app;
  final ServiceLocator serviceLocator;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ServiceLocator>.value(value: serviceLocator),
        ChangeNotifierProvider<CustomTheme>(
          create: (BuildContext context) =>
              CustomTheme(themeMode: CustomMode.light),
        ),
      ],
      child: app,
    );
  }
}

class YearApp extends StatelessWidget {
  const YearApp({
    super.key,
    required this.initialRoute,
    required this.serviceLocator,
  });
  final String initialRoute;
  final ServiceLocator serviceLocator;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      child: AppTheme(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '25 Year More',
          themeMode: CustomTheme.modelTheme == CustomMode.light
              ? ThemeMode.light
              : ThemeMode.dark,
          theme: Provider.of<CustomTheme>(context).currentTheme,
          initialRoute: initialRoute,
          onGenerateRoute: onGenerateAppRoute(
            AppRoutesFactory(serviceLocator),
          ),
        ),
      ),
    );
  }
}
