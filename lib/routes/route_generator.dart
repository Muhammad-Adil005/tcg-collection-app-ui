import '../screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        );
      case Routes.bottomNavigationBarScreen:
        return MaterialPageRoute(
          builder: (_) => const BottomNavigationBarScreen(),
        );
      // case Routes.getStartedScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const GetStartedScreen(),
      //   );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
