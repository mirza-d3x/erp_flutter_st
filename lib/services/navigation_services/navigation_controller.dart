import 'package:flutter/material.dart';

import 'route_names.dart';

final class NavigationController {
  void openSplashPageRoute(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      RouteNames.splash,
      (route) => false,
    );
  }

  void openLoginPageRoute(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      RouteNames.login,
      (route) => false,
    );
  }

  void openPosPageRoute(BuildContext context) {
    Navigator.of(context).pushNamed(
      RouteNames.pos,
    );
  }

  void openDashboardPageRoute(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      RouteNames.dashboard,
      (route) => false,
    );
  }

  void openRetailsPageRoute(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.retails);
  }
  // void createProductsPageRoute(BuildContext context, ProductModel model) {
  //   Navigator.of(context).pushNamed(RouteNames.products, arguments: model);
  // }
}
