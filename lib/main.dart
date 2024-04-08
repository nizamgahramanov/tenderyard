import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tenderyard/feature/app/app.dart';
import 'package:tenderyard/feature/app/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    const App(),
  );
}
