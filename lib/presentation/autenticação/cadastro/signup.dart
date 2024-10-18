import 'package:cantina_senai/common/widgets/appbar/basicappbar.dart';
import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/common/widgets/inputs/inputfield.dart';
import 'package:cantina_senai/core/configs/auth_controller/auth_controller.dart';
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
  final _formKey = GlobalKey<FormState>(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Permite redimensionar quando o teclado aparece
      appBar: const BasicAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Form(
            key: _formKey, // Associa a key ao Form
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
                          Text(
                            'Venha conhecer a melhor cantina',
                            style: AppFonts.subtitle,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    InputField(
                      name: 'Nome Parcial',
                      title: 'Digite seu nome parcial',
                      campo: controller.nameUser,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira seu nome';
                        }
                        final nameExp = RegExp(r'^[A-Za-zÀ-ú\s]+$');
                        if (!nameExp.hasMatch(value)) {
                          return 'Nome inválido. Utilize apenas letras e espaços';
                        }
                        if (value.trim().split(' ').length < 2) {
                          return 'Informe o nome parcial';
                        }
                        if (value.length < 3) {
                          return 'Nome muito curto';
                        }
                        if (value.length > 50) {
                          return 'Nome muito longo';
                        }
                        return null;
                      },
                    ),
                    InputField(
                      name: 'Email',
                      title: 'Digite seu email',
                      campo: controller.email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira seu email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Por favor, insira um email válido';
                        }
                        return null;
                      },
                    ),
                    InputField(
                      name: 'Senha',
                      title: 'Digite sua senha',
                      campo: controller.pass,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira sua senha';
                        }
                        if (value.length < 6) {
                          return 'A senha deve ter pelo menos 6 caracteres';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).viewInsets.top +
                        64, // Ajusta o espaço inferior quando o teclado aparece
                  ),
                  child: Column(
                    children: [
                      BasicAppButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await controller.registrar();   
                          }

                                                
                        },
                        title: 'Criar'
                      ),
                      GestureDetector(
                        child: Text('Já possui conta? Entrar',
                            style: AppFonts.titleField.copyWith(
                                decoration: TextDecoration.underline)),
                        onTap: () {
                          Get.to(const SignInPage(),
                              transition: Transition.rightToLeft,
                              duration: const Duration(seconds: 1));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
