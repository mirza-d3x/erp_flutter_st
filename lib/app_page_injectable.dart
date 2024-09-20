import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/navigation_services/navigation_controller.dart';
import 'services/service_locator.dart';

extension AppPageInjectable on BuildContext {
  NavigationController get navigationService =>
      read<ServiceLocator>().navigationService;
}

extension DoubleFigmaExtention on double {
  double toFigmaHeigth(double fontSize) => this / fontSize;
}

extension IntigerFigmaExtention on int {
  double toFigmaHeigth(double fontSize) => this / fontSize;
}
