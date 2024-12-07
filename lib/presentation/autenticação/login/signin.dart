import 'package:cantina_senai/common/widgets/appbar/basicappbar.dart';
import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/common/widgets/inputs/inputfield.dart';
import 'package:cantina_senai/core/configs/auth_controller/auth_controller.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/presentation/autentica%C3%A7%C3%A3o/forget/forget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();

  
}

class _SignInPageState extends State<SignInPage> {
  final controller = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const BasicAppBar(),
      body: SingleChildScrollView(
        child:
          Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Login', style: AppFonts.titleFont(context), textAlign: TextAlign.start),
                              Text('Aproveite tudo de bom e do \nmelhor', style: AppFonts.subtitle(context)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        InputField(name: 'Email', 
                        title: 'Digite seu email', 
                        campo: controller.email,
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Por favor, insira um email válido';
                          }
                          return null;
                        },
                        ),
                        InputField(name: 'Senha', 
                        title: 'Digite sua senha', 
                        campo: controller.pass,
                        isPassword: true,
                        validator: (value){
                          if(value == null || value.isEmpty){
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
                    Column(
                      children: [
                        BasicAppButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await controller.login();
                            }
                          },
                          title: 'Continuar',
                        ),
                        GestureDetector(
                          child: Text(
                            'Esqueci minha senha',
                            style: AppFonts.titleFieldUnderLine(context)
                          ),
                          onTap: () {
                            Get.to(const ForgetPage(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(seconds: 1)
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

      ),
    );
  }
}
