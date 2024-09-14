import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payuung_clone/presentation/core/styles/app_theme.dart';
import 'package:payuung_clone/presentation/core/utils/lifecycle_container.dart';
import 'package:payuung_clone/presentation/routes/app_router.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final AppRouter appRouter = AppRouter();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return LifecycleContainer(
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.themeData(false, context),
              builder: EasyLoading.init(),
              routerDelegate: appRouter.router.routerDelegate,
              routeInformationProvider:
                  appRouter.router.routeInformationProvider,
              routeInformationParser: appRouter.router.routeInformationParser,
            );
          }),
    );
  }
}
