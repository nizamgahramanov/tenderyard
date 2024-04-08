import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tenderyard/common/constants.dart';
import 'package:tenderyard/feature/app/app_theme/app_theme.dart';
import 'package:tenderyard/route_generator.dart';
import 'config_bloc/bloc.dart';

class App extends StatefulWidget {
  const App({
    super.key,
  });
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "Main Navigator");
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ConfigBloc()..add(InitApp()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'TenderYard',
              navigatorKey: App.navigatorKey,
              theme: AppTheme.light(),
              initialRoute: Screens.register,
              onGenerateRoute: RouteGenerator.generateRoute);
        },
      ),
    );
  }
}
