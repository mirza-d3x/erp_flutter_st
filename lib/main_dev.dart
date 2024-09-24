import 'config/env/environment.dart';
import 'main.dart';

void main() {
  BuildEnvironment.init(
    flavor: BuildFlavor.development,
    baseUrl: 'http://94.200.156.234:85/api/',
    environment: 'dev',
  );
  assert(env != null);
  mainInit();
}
