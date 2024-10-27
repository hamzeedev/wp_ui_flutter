import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'views/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'WhatsApp UI',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
      ),
    );
  }
}
