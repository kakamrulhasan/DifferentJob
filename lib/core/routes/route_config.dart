part of 'route_import_path.dart';

class AppRouter {
  static Route<dynamic> genearateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashscreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case RouteName.LoginSignupScreen:
        return MaterialPageRoute(builder: (_) => const LoginSignupScreen());
      case RouteName.LoginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RouteName.VerifyCodeScreen:
        return MaterialPageRoute(builder: (_) => VerifyCodeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route is not found'))),
        );
    }
  }
}
