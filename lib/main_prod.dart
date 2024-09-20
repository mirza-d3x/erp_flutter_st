import 'config/env/environment.dart';
import 'main.dart';

void main() {
  BuildEnvironment.init(
    flavor: BuildFlavor.production,
    baseUrl: 'https://ugpbrljcqcetfxjdmesv.supabase.co',
    environment: 'prod',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVncGJybGpjcWNldGZ4amRtZXN2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg1MTE0NDksImV4cCI6MjAyNDA4NzQ0OX0.D6-isg7T-6vZhqpwNjTnmAn_4sPLD_Ct-8yo-CGCwIM',
  );
  assert(env != null);
  mainInit();
}
