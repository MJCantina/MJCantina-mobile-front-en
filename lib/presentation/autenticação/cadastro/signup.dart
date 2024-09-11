import 'package:cantina_senai/common/widgets/appbar/basicappbar.dart';
import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/common/widgets/inputs/inputfield.dart';
import 'package:cantina_senai/core/configs/auth_controller/auth_controller.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/presentation/autentica%C3%A7%C3%A3o/login/signin.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarArrow(),
      body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cadastre-se',
                          style: AppFonts.titleFont,
                          textAlign: TextAlign.start,
                        ),
                        Text('Venha conhecer a melhor cantina', style: AppFonts.subtitle),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputField(name: 'Nome', title: 'Digite seu nome', campo: controller.nameUser),
                  InputField(name: 'Email', title: 'Digite seu email', campo: controller.email),
                  InputField(name: 'Senha', title: 'Digite sua senha', campo: controller.pass),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Column(
                  children: [
                    BasicAppButton(
                      onPressed: () async {
                        await controller.registrar();
                      },
                      title: 'Criar',
                    ),
                    GestureDetector(
                      child: const Text(
                        'Já possui conta? Entrar',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onTap: () {
                        Get.to(const SignInPage(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(seconds: 1)
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
      }
  }
