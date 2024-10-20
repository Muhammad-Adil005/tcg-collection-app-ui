import '../screens/screens.dart';

class SearchProvider extends ChangeNotifier {
  String _searchText = '';

  String get searchText => _searchText;

  void updateSearchText(String text) {
    _searchText = text;
    notifyListeners();
  }
}
