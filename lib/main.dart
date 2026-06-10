//To do list
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'routes/app_routes_configuration.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget
// {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       theme: AppTheme.lightTheme,
//       debugShowCheckedModeBanner: false,
//       home: const LandingPage(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
