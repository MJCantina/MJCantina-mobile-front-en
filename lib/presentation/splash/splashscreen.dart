import 'package:cantina_senai/common/helpers/whitepage.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_images.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:cantina_senai/presentation/main_pages/home/home.dart';
import 'package:cantina_senai/presentation/welcome/start.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 500),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, -8),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward().whenComplete(() async {
      // Navegue para a tela branca de transição
      Get.offAll(() => const WhiteScreen(),
        transition: Transition.rightToLeft,
        duration: const Duration(seconds: 1),
      );

      // Aguarde um breve intervalo e depois navegue para a tela final
      await Future.delayed(const Duration(seconds: 1));

      final isAuthenticated = AuthService.to.userIsAuthenticated.value;

      if (isAuthenticated) {
        Get.offAll(() => const HomePage(),
          transition: Transition.rightToLeft,
          duration: const Duration(seconds: 2, milliseconds: 500),
        );
      } else {
        Get.offAll(() => const StartPage(),
          transition: Transition.fade,
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors.primary,
            Color(0xFFEA4A70),
          ]),
        ),
        child: Center(
          child: SlideTransition(
            position: _animation,
            child: Image.asset(AppImages.logo),
          ),
        ),
      ),
    );
  }
}
