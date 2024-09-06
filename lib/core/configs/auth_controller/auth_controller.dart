import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final email = TextEditingController();
  final pass = TextEditingController();
  final nameUser = TextEditingController();

  login () async {
    await AuthService.to.login(email.text, pass.text);

    

  }

  registrar () async {
    await AuthService.to.createUser(email.text, pass.text, nameUser.text);

  }

  


}