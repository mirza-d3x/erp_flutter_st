part of 'navigation.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateAppRoute(
    RoutesFactory routesFactory) {
  return (RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return routesFactory.createSplashPageRoute();
      case RouteNames.login:
        return routesFactory.createLoginPageRoute();
      case RouteNames.pos:
        return routesFactory.createPosPageRoute();
      case RouteNames.dashboard:
        return routesFactory.createDashBoardPageRoute();
      case RouteNames.retails:
        return routesFactory.createRetailsPageRoute();
      case RouteNames.menuDetails:
        return routesFactory.createMenuDetailsPageRoute();

      //   return routesFactory.createCartPageRoute();
      // case RouteNames.products:
      //   return routesFactory
      //       .createProductsPageRoute(settings.arguments as ProductModel);
    }
    return null;
  };
}
