enum BuildFlavor { production, development }

BuildEnvironment? get env => _env;
BuildEnvironment? _env;

class BuildEnvironment {
  /// The backend server.
  final String baseUrl;
  final String anonKey;
  final BuildFlavor flavor;
  final String environment;

  bool debuggable = true;
  bool loggable = true;

  BuildEnvironment._init({
    required this.flavor,
    required this.baseUrl,
    required this.anonKey,
    required this.environment,
  }) {
    switch (environment) {
      case 'dev':
        debuggable = true;
        loggable = true;
        break;
      case 'prod':
      default:
        debuggable = false;
        loggable = false;
        break;
    }
  }

  /// Sets up the top-level [env] getter on the first call only.
  static void init({
    required flavor,
    required baseUrl,
    required environment,
    required anonKey,
  }) =>
      _env ??= BuildEnvironment._init(
        flavor: flavor,
        baseUrl: baseUrl,
        environment: environment,
        anonKey: anonKey,
      );
}
