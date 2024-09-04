import 'package:cantina_senai/common/widgets/appbar/basicappbar.dart';
import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/common/widgets/inputs/inputfield.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState(
    
  );
}

class _SignInPageState extends State<SignInPage> {

  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  Future<void> _login () async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
      print("Usuário logado: ${userCredential.user!.email}");
    } catch (e) {
      print('Erro: $e');
    }

  }
  


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBarArrow(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Login', style: AppFonts.titleFont, textAlign: TextAlign.start,), 
              Text('Aproveite tudo de bom e do \n melhor', style: AppFonts.subtitle),
              SizedBox(height: 16,),
              InputField(name: 'Email', title: 'Digite seu email', campo: _emailController,),
              InputField(name: 'Senha', title: 'Digite sua senha', campo: _passwordController,)
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              children: [
                BasicAppButton(onPressed: (){
                  _login();
                }, title: 'Continuar'),
                Text('Esqueci minha senha', style: TextStyle(decoration: TextDecoration.underline, fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600))
              ],
            ),
          )

        ],
      ),
    );
  }
}