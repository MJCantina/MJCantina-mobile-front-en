import 'package:cantina_senai/common/widgets/appbar/appbar.dart';
import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/presentation/autentica%C3%A7%C3%A3o/cadastro/signin.dart';
import 'package:cantina_senai/presentation/autentica%C3%A7%C3%A3o/cadastro/signup.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text('Seja bem vindo!', style: AppFonts.titleFont),
              Text('aproveite nossas comidas', style: AppFonts.subtitle),
            ],
          ),

          Column(
            children: [
              BasicAppButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> SignInPage()));
              }, title: 'Login'),
              Text('ou', style: AppFonts.titleField),
              BasicAppButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> SignUpPage()));
              }, title: 'Cadastre-se')
            ],
          )
        ],
      ),
    );
  }
}