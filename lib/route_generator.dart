import 'package:flutter/material.dart';
import 'package:tenderyard/feature/register/presentation/pages/juridical_person_screen.dart';
import 'package:tenderyard/feature/register/presentation/pages/register_screen.dart';
import 'common/constants.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Screens.register:
        return MaterialPageRoute(
            settings: settings, builder: (_) => RegisterScreen());
        case Screens.registerAsJuridicalPerson:
        return MaterialPageRoute(
            settings: settings, builder: (_) => JuridicalPersonScreen());
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Center(
            child: Text('undefined route'),
          ),
        );
    }
  }
}
