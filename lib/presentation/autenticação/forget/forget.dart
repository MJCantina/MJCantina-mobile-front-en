import 'package:cantina_senai/common/widgets/appbar/appbar.dart';
import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/common/widgets/inputs/inputfield.dart';
import 'package:cantina_senai/core/configs/auth_controller/auth_controller.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPage extends StatefulWidget {
  const ForgetPage({super.key});

  @override
  State<ForgetPage> createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {

  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Form(
          key: _formKey,
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
                  const SizedBox(height: 16,),
                  InputField(campo: _emailController, 
                  name: 'Email', 
                  title: 'Digite seu email',
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
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: BasicAppButton(onPressed: (){
                  if (_formKey.currentState!.validate()) {
                      _controller.sendPasswordResetEmail();
                  }       
                },
                title: 'Enviar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}