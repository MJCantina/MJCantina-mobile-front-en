import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_images.dart';
import 'package:cantina_senai/presentation/welcome/start.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {

 late AnimationController _animationController; 
 late Animation <Offset> _animation;


  void initState(){
    super.initState();
    _animationController = AnimationController(vsync: this,
    duration: const Duration(seconds: 1, milliseconds: 500));

    _animation = Tween<Offset>(
      begin: const Offset(0, -8),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    redirect();

    _animationController.forward();
  }


  void dispose(){
    _animationController.dispose();
    super.dispose();
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
          child: SlideTransition(position: _animation,
          child: Image.asset(AppImages.logo),
          )
        ),
      ),
    );
  }


  Future <void> redirect () async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const StartPage()));
  }

}


