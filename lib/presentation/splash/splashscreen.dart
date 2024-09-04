import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_images.dart';
import 'package:cantina_senai/presentation/welcome/start.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void initState(){
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: 
          [
            AppColors.primary,
            Color(0xFFEA4A70)
          ])
        ),
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }


  Future <void> redirect () async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const StartPage()));
  }

}


