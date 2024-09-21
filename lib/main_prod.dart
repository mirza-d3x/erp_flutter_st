import 'config/env/environment.dart';
import 'main.dart';

void main() {
  BuildEnvironment.init(
    flavor: BuildFlavor.production,
    baseUrl: 'http://94.200.156.234:85/api',
    environment: 'prod',
  );
  assert(env != null);
  mainInit();
}
