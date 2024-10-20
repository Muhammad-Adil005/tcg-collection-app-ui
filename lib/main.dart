import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcg_collection_app/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TCG Collection App',
          theme: ThemeData(
            useMaterial3: true,
          ),
          initialRoute: Routes.bottomNavigationBarScreen,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
