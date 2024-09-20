import 'config/env/environment.dart';
import 'main.dart';

void main() {
  BuildEnvironment.init(
    flavor: BuildFlavor.production,
    baseUrl: 'https://ugpbrljcqcetfxjdmesv.supabase.co',
    environment: 'prod',
  );
  assert(env != null);
  mainInit();
}
