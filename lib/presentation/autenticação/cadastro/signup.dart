

import 'package:cantina_senai/common/widgets/appbar/basicappbar.dart';
import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/common/widgets/inputs/inputfield.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/presentation/autentica%C3%A7%C3%A3o/cadastro/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future <void> register () async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());

        await userCredential.user!.updateDisplayName(_nameController.text.trim());
        print("Usuário registrado: ${userCredential.user!.email} com nome ${userCredential.user!.displayName}");


    }
    catch(e){
      print('Erro');
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarArrow(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cadastre-se',
                style: AppFonts.titleFont,
                textAlign: TextAlign.start,
              ),
              Text('Venha conhecer a melhor cantina', style: AppFonts.subtitle),
              SizedBox(
                height: 16,
              ),
              InputField(name: 'Nome', title: 'Digite seu nome', campo: _nameController,),
              InputField(name: 'Email', title: 'Digite seu email', campo: _emailController,),
              InputField(name: 'Senha', title: 'Digite sua senha', campo: _passwordController,)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              children: [
                BasicAppButton(onPressed: () {
                  register();
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> SignInPage()));
                }, title: 'Criar'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
