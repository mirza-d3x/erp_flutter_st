import 'config/env/environment.dart';
import 'main.dart';

void main() {
  BuildEnvironment.init(
    flavor: BuildFlavor.development,
    baseUrl: 'https://dhkvglxeegwbpdxhkrid.supabase.co',
    environment: 'dev',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRoa3ZnbHhlZWd3YnBkeGhrcmlkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk5NDI4MzUsImV4cCI6MjAzNTUxODgzNX0.aMfqWfPAp48ko1LkwjFmP5WvDZF6BV9KiDKy5cuhFJY',
  );
  assert(env != null);
  mainInit();
}
