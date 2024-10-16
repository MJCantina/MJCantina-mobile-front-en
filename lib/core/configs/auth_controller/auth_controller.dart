import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  final email = TextEditingController();
  final pass = TextEditingController();
  final nameUser = TextEditingController();
  final telefone = TextEditingController();
  final cpf = TextEditingController();

  Future<void> login() async {
    try {
      await AuthService.to.login(email.text, pass.text);
    } catch (e) {
      Get.snackbar('Erro', e.toString(), backgroundColor: Colors.red);
    }
  }

  Future<void> registrar() async {
    try {
      await AuthService.to.createUser(email.text, pass.text, nameUser.text);
    } catch (e) {
      Get.snackbar('Erro', e.toString(), backgroundColor: Colors.red);
    }
  }

  Future<void> sendPasswordResetEmail() async {
    try {
      await AuthService.to.sendPasswordResetEmail(email.text);
      Get.snackbar('Sucesso', 'Link de redefinição de senha enviado para ${email.text}.', backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar('Erro', e.toString(), backgroundColor: Colors.red);
    }
  }

  Future<void> ctSend () async {
    try {
      await AuthService.to.salvarInformacoesAdicionais(telefone.text, cpf.text);
      Get.snackbar('Sucesso', 'Dados salvos com sucesso', backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar('Erro', e.toString(), backgroundColor: Colors.red);
    }
  }

}
