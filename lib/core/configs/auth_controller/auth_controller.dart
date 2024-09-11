import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  final email = TextEditingController();
  final pass = TextEditingController();
  final nameUser = TextEditingController();

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

}
