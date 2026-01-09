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
      case RouteName.CreateSellerAccount:
        return MaterialPageRoute(builder: (_) => CreateSellerAccount());
      case RouteName.CreateBuyersAccount:
        return MaterialPageRoute(builder: (_) => CreateBuyersAccount());
      case RouteName.CreateProfileScreen:
        return MaterialPageRoute(builder: (_) => CreateProfileScreen());
      case RouteName.CreateProfileNextScreen:
        return MaterialPageRoute(builder: (_) => CreateProfileNextScreen());
      case RouteName.ForgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case RouteName.ForgetOptScreen:
        return MaterialPageRoute(builder: (_) => ForgetOptScreen());
      case RouteName.SetNewPassword:
        return MaterialPageRoute(builder: (_) => SetNewPassword());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route is not found'))),
        );
    }
  }
}
