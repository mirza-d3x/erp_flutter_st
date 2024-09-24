part of 'navigation.dart';

abstract interface class RoutesFactory {
  Route<dynamic> createSplashPageRoute();
  Route<dynamic> createLoginPageRoute();
  Route<dynamic> createPosPageRoute();

  // Route<dynamic> createProductsPageRoute(ProductModel model);
}
