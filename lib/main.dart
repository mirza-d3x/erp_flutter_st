import 'dart:async';

import 'package:erp_mobile/app/app.dart';
import 'package:erp_mobile/config/env/environment.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'services/service_locator.dart';
import 'utils/console_log.dart';
import 'utils/state_change_observer.dart';

Future<void> mainInit() async {
  const String initialRoute =
      String.fromEnvironment("INITIAL_ROUTE", defaultValue: "/splash");

  runZonedGuarded<void>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final ServiceLocator serviceLocator = ServiceLocator(env!.baseUrl)
        ..configureServices();

      await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

      runApp(
        Root(
          // appThemeMode: AppThemeMode.lightTheme,
          app: YearApp(
            initialRoute: initialRoute,
            serviceLocator: serviceLocator,
          ),
          serviceLocator: serviceLocator,
        ),
      );

      if (kDebugMode) {
        Bloc.observer = DebuggableBlocObserver(describeStateChanges: false);
      }
    },
    (error, stack) {
      consoleLog("ERP_APP", error: error.toString(), stackTrace: stack);
    },
  );
}
