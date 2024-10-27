import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_wp_ui/views/screens/tab_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Get.to(() => const TabScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/wp.png",
                  height: 82,
                  width: 82,
                ),
              ),
            ),
            const Column(
              children: [
                Text(
                  "from",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Meta",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
