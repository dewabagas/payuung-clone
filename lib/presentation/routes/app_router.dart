import 'package:go_router/go_router.dart';
import 'package:payuung_clone/presentation/core/pages/page_splash.dart';
import 'package:payuung_clone/presentation/dashboard/page_dashboard.dart';
import 'package:payuung_clone/presentation/routes/app_route_paths.dart';

class AppRouter {
  final GoRouter router = GoRouter(
      initialLocation: RoutePaths.splash,
      routerNeglect: true,
      routes: [
        GoRoute(
            path: RoutePaths.splash,
            builder: (context, state) => const PageSplash()),
        GoRoute(
            path: RoutePaths.dashboard,
            builder: (context, state) => const PageDashboard()),
      ]);
}
