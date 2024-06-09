import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xten_project/login_page.dart';
import 'package:xten_project/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      checkLoginStatus(context);
    });

    return const Scaffold(
      backgroundColor: Color(0xFF8F00FF),
      body: Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/logo.png'),
          radius: 50,
        ),
      ),
    );
  }

  void checkLoginStatus(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Get.off(() => const HomePageScreen());
    } else {
      Get.off(() => const LoginPage());
    }
  }
}
