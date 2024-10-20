import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tcg_collection_app/screens/screens.dart';

import '../widgets/portfolio_button_widget.dart';
import '../widgets/search_button_widget.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomNavigationProvider(),
      child: Consumer<BottomNavigationProvider>(
        builder: (context, bottomNavProvider, child) {
          return Scaffold(
            body: bottomNavProvider.screens[bottomNavProvider.currentIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xFFE0E0E0),
                  width: 1.0,
                ),
              ),
              child: BottomAppBar(
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SearchButtonWidget(
                      isSelected: bottomNavProvider.currentIndex == 0,
                      onPressed: () {
                        bottomNavProvider.changeIndex(0);
                      },
                    ),
                    SizedBox(width: 20.w),
                    PortfolioButtonWidget(
                      isSelected: bottomNavProvider.currentIndex == 1,
                      onPressed: () {
                        bottomNavProvider.changeIndex(1);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/*
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              currentIndex: bottomNavProvider.currentIndex,
              onTap: (index) {
                bottomNavProvider.changeIndex(index);
              },
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.green,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: 'Portfolio'),
              ],
            ),
*/
