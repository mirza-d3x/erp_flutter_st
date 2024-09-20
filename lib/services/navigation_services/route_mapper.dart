part of 'navigation.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateAppRoute(
    RoutesFactory routesFactory) {
  return (RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return routesFactory.createSplashPageRoute();

      //   return routesFactory.createCartPageRoute();
      // case RouteNames.products:
      //   return routesFactory
      //       .createProductsPageRoute(settings.arguments as ProductModel);
    }
    return null;
  };
}
