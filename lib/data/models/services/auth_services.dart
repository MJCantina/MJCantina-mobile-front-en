import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rx<User?> _firebaseUser = Rx<User?>(null);
  var userIsAuthenticated = false.obs;
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  void onInit (){
    super.onInit();

    _firebaseUser.bindStream(_auth.authStateChanges());

    ever(_firebaseUser, (User? user){
      if(user != null){
        userIsAuthenticated.value = true;
        storeToken();
      } else {
        userIsAuthenticated.value = false;
      }
    }) ;
  } 

  User? get user => _firebaseUser.value;
  static AuthService get to => Get.find<AuthService>();

  void showSnack (String titulo, String mensagem) {
    Get.snackbar(
    titulo,
    mensagem,
    backgroundColor: Colors.grey,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM
    );
  }

  Future<void> createUser(String email, String password, String name) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    if (user != null) {
      await user.updateDisplayName(name);
      await user.reload(); // Recarrega os dados do usuário para garantir que o nome seja atualizado
      _firebaseUser.value = _auth.currentUser; // Atualiza o valor do usuário no Rx
      storeToken(); // Armazena o token após a criação do usuário

      showSnack('Sucesso', 'Usuário criado com sucesso');
    }
  } catch (e) {
    showSnack('Erro ao criar usuário', e.toString());
  }
}


  Future <void> login (String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      showSnack('Erro ao logar', e.toString());
    }
  }

  Future <void> logout () async {
    try {
      await _auth.signOut();
      await _storage.delete(key: 'firebase_token');

    } catch (e) {
      showSnack('Erro ao fazer logout', e.toString());
    }
  }

  Future <void> storeToken () async {
    if (user != null) {
      String? token = await user!.getIdToken();
      if (token != null) {
        await _storage.write(key: 'firebase_token', value: token);
      }
    }
  }





}