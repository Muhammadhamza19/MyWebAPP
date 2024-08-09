import 'package:local_grocery/startup.dart';
import 'package:local_grocery/support/config/app_shared_pref.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  /// Initializing the shared preferences
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPref.initSessionManager();

  /// Registering the view models

  /// Running the app
  runApp(Startup());
}
