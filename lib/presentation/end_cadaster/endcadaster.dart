import 'package:cantina_senai/common/widgets/appbar/basicappbar.dart';
import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/common/widgets/inputs/inputfield.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/presentation/autentica%C3%A7%C3%A3o/login/signin.dart';
import 'package:flutter/material.dart';

class EndCadaster extends StatefulWidget {
  const EndCadaster({super.key});

  @override
  State<EndCadaster> createState() => _EndCadasterState();
}

class _EndCadasterState extends State<EndCadaster> {

  final TextEditingController _telefone = TextEditingController();
  final TextEditingController _cpf = TextEditingController();

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
                        'Ainda não acabou',
                        style: AppFonts.titleFont,
                        textAlign: TextAlign.start,
                      ),
                      Text('Preencha tudo corretamente', style: AppFonts.subtitle),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                InputField(name: 'Telefone', title: 'Digite seu telefone', campo: _telefone,),
                InputField(name: 'CPF', title: 'Digite seu cpf', campo: _cpf,),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Column(
                children: [
                  BasicAppButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> const SignInPage()));
                  }, title: 'Continuar'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}