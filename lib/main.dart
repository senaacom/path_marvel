import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/init/navigation/navigation_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'product/utils/material_color.dart';
import 'view/splash/view/splash_view.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        highlightColor: AppColors.marvelBlack,
        primarySwatch: AppColors.materialColorGenerator(
          AppColors.marvelBlack,
        ),
      ),
      home: const SplashView(),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationManager.instance.navigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}
