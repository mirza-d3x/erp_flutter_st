// ignore_for_file: implicit_call_tearoffs

part of 'navigation.dart';

final class AppRoutesFactory implements RoutesFactory {
  final ServiceLocator _serviceLocator;
  const AppRoutesFactory(this._serviceLocator);

  @override
  Route createSplashPageRoute() {
    return CustomRoute(
      builder: SplashScreenRouteBuilder(_serviceLocator),
    );
  }

  @override
  Route createLoginPageRoute() {
    return CustomRoute(
      builder: LoginScreenRouteBuilder(_serviceLocator),
    );
  }

//   @override
//   Route createProductsPageRoute(ProductModel model) {
//     return CustomRoute(
//       builder: ProductDetailsBuilder(model: model),
//     );
//   }
}

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({required super.builder});

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
          .animate(CurvedAnimation(
        parent: animation,
        curve: const Interval(0.00, 0.90, curve: Curves.linearToEaseOut),
      )),
      child: child,
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}
