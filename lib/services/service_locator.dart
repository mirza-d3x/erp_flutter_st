import 'package:erp_mobile/services/navigation_services/navigation_controller.dart';
import 'package:get_it/get_it.dart';

final class ServiceLocator {
  // final String _baseUrl;
  // final String _anonKey;

  final GetIt _registry = GetIt.asNewInstance();

  // ServiceLocator(String baseUrl, String anonKey)
  //     : _anonKey = anonKey,
  //       _baseUrl = baseUrl;

  NavigationController get navigationService =>
      _registry.get<NavigationController>();

  void configureServices() {
    _registerNonDebuggableServices();
  }

  void _registerNonDebuggableServices() {
    _registry.registerLazySingleton(() => NavigationController());
  }
}
