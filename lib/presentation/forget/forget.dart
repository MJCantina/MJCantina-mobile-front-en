import 'package:cantina_senai/common/widgets/appbar/basicappbar.dart';
import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/common/widgets/inputs/inputfield.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class ForgetPage extends StatefulWidget {
  const ForgetPage({super.key});

  @override
  State<ForgetPage> createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {

  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Text('Esqueceu sua senha?', style: AppFonts.titleFont,),
                      Text('Enviaremos um link para redefinir sua senha', style: AppFonts.subtitle),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                InputField(campo: _emailController, name: 'Email', title: 'Digite seu email'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: BasicAppButton(onPressed: (){
                      
              },
              title: 'Enviar'),
            )
            
          ],
        ),
      ),
    );
  }
}