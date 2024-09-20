import 'config/env/environment.dart';
import 'main.dart';

void main() {
  BuildEnvironment.init(
    flavor: BuildFlavor.development,
    baseUrl: 'https://dhkvglxeegwbpdxhkrid.supabase.co',
    environment: 'dev',
  );
  assert(env != null);
  mainInit();
}
