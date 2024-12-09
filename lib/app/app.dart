// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';

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
  final ErpApp app;
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

class ErpApp extends StatelessWidget {
  const ErpApp({
    super.key,
    required this.initialRoute,
    required this.serviceLocator,
  });
  final String initialRoute;
  final ServiceLocator serviceLocator;

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ERP Flutter',
        themeMode: CustomTheme.modelTheme == CustomMode.light
            ? ThemeMode.light
            : ThemeMode.dark,
        theme: Provider.of<CustomTheme>(context).currentTheme,
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateAppRoute(
          AppRoutesFactory(serviceLocator),
        ),
      ),
    );
  }
}
