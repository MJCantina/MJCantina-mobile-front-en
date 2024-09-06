
import 'package:cantina_senai/common/widgets/appbar/basicappbar.dart';
import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/common/widgets/inputs/inputfield.dart';
import 'package:cantina_senai/core/configs/auth_controller/auth_controller.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:cantina_senai/presentation/forget/forget.dart';
import 'package:cantina_senai/presentation/main_pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState(
    
  );
}

class _SignInPageState extends State<SignInPage> {

  final controller = Get.put(AuthController());


  


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const AppBarArrow(),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
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
                      Text('Login', style: AppFonts.titleFont, textAlign: TextAlign.start,), 
                      Text('Aproveite tudo de bom e do \n melhor', style: AppFonts.subtitle),
                    ],
                  ),
                ),
                const SizedBox(height: 16,),
                InputField(name: 'Email', title: 'Digite seu email', campo: controller.email,),
                InputField(name: 'Senha', title: 'Digite sua senha', campo: controller.pass,)
              ],
            ),
        
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Column(
                children: [
                  BasicAppButton(onPressed: () async{
                    await controller.login();
                    if (AuthService.to.userIsAuthenticated.value){
                      Get.to(() => const HomePage());
                    }
                  }, 
                  title: 'Continuar'),
                  GestureDetector(
                    child: const Text(
                      'Esqueci minha senha', 
                      style: TextStyle(
                        decoration: TextDecoration.underline, 
                        fontSize: 16, 
                        color: AppColors.black, 
                        fontWeight: FontWeight.w600),
                        ),
                        onTap: (){
                          Navigator.of(context)
                          .push(MaterialPageRoute(builder: (BuildContext context)=> const ForgetPage()));
                        },
                        ),
                ],
              ),
            )
        
          ],
        ),
      ),
    );
  }
}