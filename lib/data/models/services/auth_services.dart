
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rx<User?> _firebaseUser = Rx<User?>(null);
  var userIsAuthenticated = false.obs;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();

    // Vincula o stream do FirebaseAuth ao _firebaseUser
    _firebaseUser.bindStream(_auth.authStateChanges());

    // Sempre que _firebaseUser mudar, executa esta função
    ever(_firebaseUser, (User? user) {
      if (user != null) {
        userIsAuthenticated.value = true;
        storeToken();  // Armazena o token quando o usuário está autenticado
      } else {
        userIsAuthenticated.value = false;
      }
    });
  }

  User? get user => _firebaseUser.value;
  static AuthService get to => Get.find<AuthService>();

  void showSnack(String titulo, String mensagem) {
    Get.snackbar(
      titulo,
      mensagem,
      backgroundColor: Colors.grey,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 16),
    );
  }

  Future<void> createUser(String email, String password, String name) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;

      if (user != null) {
        await user.updateDisplayName(name);
        await user.reload();
        _firebaseUser.value = _auth.currentUser;
        storeToken();  // Armazena o token após criação do usuário
        showSnack('Sucesso', 'Usuário criado com sucesso');
      }
    } catch (e) {
      showSnack('Erro ao criar usuário, tente novamente', e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      storeToken();  // Armazena o token após login
    } catch (e) {
      showSnack('Erro ao fazer login', e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      await _storage.delete(key: 'firebase_token');
    } catch (e) {
      showSnack('Erro ao fazer logout', e.toString());
    }
  }

  Future<void> storeToken() async {
    if (user != null) {
      String? token = await user!.getIdToken();
      if (token != null) {
        await _storage.write(key: 'firebase_token', value: token);
      }
    }
  }
}
