import 'package:cantina_senai/common/widgets/appbar/basicappbar.dart';
import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/common/widgets/inputs/inputfield.dart';
import 'package:cantina_senai/core/configs/auth_controller/auth_controller.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/presentation/configuration/configurations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EndCadaster extends StatefulWidget {
  const EndCadaster({super.key});

  @override
  State<EndCadaster> createState() => _EndCadasterState();
}

class _EndCadasterState extends State<EndCadaster> {
  bool? value = false;
  final _key = GlobalKey<FormState>();
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const BasicAppBar(),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Form(
            key: _key,
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
                            style: AppFonts.titleFont(context),
                            textAlign: TextAlign.start,
                          ),
                          Text('Preencha tudo corretamente',
                              style: AppFonts.subtitle(context)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    InputField(
                      name: 'Telefone',
                      title: 'Digite seu telefone',
                      campo: controller.telefone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira seu telefone';
                        }
                        final phoneExp =
                            RegExp(r'^\(?\d{2}\)?[\s-]?\d{4,5}-?\d{4}$');
                        if (!phoneExp.hasMatch(value)) {
                          return 'Telefone inválido. Utilize o formato correto';
                        }
                        return null;
                      },
                    ),
                    InputField(
                      name: 'CPF',
                      title: 'Digite seu CPF',
                      campo: controller.cpf,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira seu CPF';
                        }
                        if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                          return 'Por favor, insira um CPF válido';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: value,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            activeColor: AppColors.primary,
                            checkColor: AppColors.white,
                            onChanged: (bool? newValue) {
                              setState(() {
                                value = newValue;
                              });
                            },
                          ),
                          SizedBox(
                            width: size.width * 0.8,
                            child: RichText(
                              text: TextSpan(
                                  text: 'Eu li e aceito os ',
                                  style: AppFonts.textHolder(context),
                                  children: [
                                    TextSpan(
                                        text: 'termos e condições de uso',
                                        style: AppFonts.textHolderUnderLine(context),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.to(const Configurations());
                                          }),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 128),
                  child: Column(
                    children: [
                      BasicAppButton(
                        onPressed: () async {
                          if (_key.currentState!.validate() && value == true) {
                            await controller.ctSend();
                          } else {
                            Get.snackbar(
                              'Termos e condições',
                              'Aceite os termos de uso',
                              backgroundColor: AppColors.primary,
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM,
                              margin: const EdgeInsets.all(16),
                            );
                          }
                        },
                        title: 'Continuar',
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
