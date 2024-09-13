import 'package:cantina_senai/common/widgets/appbar/animated_appbar/animatioappbar.dart';
import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/presentation/autentica%C3%A7%C3%A3o/login/signin.dart';
import 'package:cantina_senai/presentation/autentica%C3%A7%C3%A3o/cadastro/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with SingleTickerProviderStateMixin {

  late AnimationController _animationController; 
  late Animation <Offset> _animation;
  late Animation <Offset> _animationBottom;

  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, -3), // Começa fora da tela (deslizando de cima)
      end: Offset.zero,            // Termina na posição normal
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationBottom = Tween<Offset>(
      begin: const Offset(0, 3), // Começa fora da tela (deslizando de cima)
      end: Offset.zero,            // Termina na posição normal
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnimatedAppBar(animation: _animation), // Usando a app bar animada
      body: Padding(
        padding: const EdgeInsets.only(top: 64, bottom: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('Seja bem vindo!', style: AppFonts.titleFont),
                Text('aproveite nossas comidas', style: AppFonts.subtitle),
              ],
            ),
        
            SlideTransition(
              position: _animationBottom,
              child: Column(
                children: [
                  BasicAppButton(onPressed: (){
                    Get.to(
                        () => const SignInPage(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(seconds: 1)
                      );
                  }, title: 'Login'),
                  Text('ou', style: AppFonts.titleField),
                  BasicAppButton(onPressed: (){
                    Get.to(
                        () => const SignUpPage(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(seconds: 1)
                      );

                  }, title: 'Cadastre-se')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
