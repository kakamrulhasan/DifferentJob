part of 'route_import_path.dart';

class AppRouter {
  static Route<dynamic> genearateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashscreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route is not found'),)),
        );
    }
  }
}
