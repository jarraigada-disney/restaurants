import 'package:flutter/material.dart';
import 'package:font_inspire_twdc/font_inspire_twdc.dart';
import 'package:restaurant_app/config/router/app_router.dart';
import 'package:restaurant_app/config/theme/app_theme.dart';   
void main() {
  InspireTextStyle.apply();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).getTheme(),
    );
  }
}
