import 'package:flutter/material.dart';

// Pages
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/product_details/presentation/product_details_page.dart';
import '../../data/models/product_model.dart';

class AppRouter {
  static const String onboarding = '/';
  static const String home = '/home';
  static const String productDetails = '/product-details';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
        );

      case home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );

      case productDetails:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsPage(product: product),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
