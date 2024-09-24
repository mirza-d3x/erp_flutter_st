import 'package:erp_mobile/services/api_service/service.dart';
import 'package:erp_mobile/services/navigation_services/navigation_controller.dart';
import 'package:get_it/get_it.dart';

final class ServiceLocator {
  final String _baseUrl;

  final GetIt _registry = GetIt.asNewInstance();

  ServiceLocator(String baseUrl) : _baseUrl = baseUrl;

  NavigationController get navigationService =>
      _registry.get<NavigationController>();

  ApiController get apiService => _registry.get<ApiController>();

  void configureServices() {
    _registerNonDebuggableServices();
  }

  void _registerNonDebuggableServices() {
    _registry.registerLazySingleton(() => NavigationController());
    _registry.registerLazySingleton(() => ApiController(_baseUrl));
  }
}
