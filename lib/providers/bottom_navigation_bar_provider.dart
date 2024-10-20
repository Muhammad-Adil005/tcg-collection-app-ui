import '../screens/screens.dart';

class BottomNavigationProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  List<Widget> screens = [
    const SearchScreen(),
    const PortfolioScreen(),
  ];

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
