import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/presentation/main_pages/home/home.dart';
import 'package:cantina_senai/presentation/splash/splashscreen.dart';
import 'package:cantina_senai/presentation/welcome/start.dart';
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
        Get.offAll(const HomePage(),
        transition: Transition.rightToLeft,
        duration: const Duration(seconds: 1, milliseconds: 500)
        ); // Navega para a home se autenticado
      } else { 
        userIsAuthenticated.value = false;
        Get.offAll(const SplashPage(),
        transition: Transition.rightToLeft,
        duration: const Duration(seconds: 1, milliseconds: 500),
        ); // Navega para a tela inicial se não autenticado
      }
    },
    );
  }

  // Verifica se há um token armazenado no Flutter Secure Storage

  User? get user => _firebaseUser.value;
  static AuthService get to => Get.find<AuthService>();

  void showSnack(String titulo, String mensagem) {
    Get.snackbar(
      titulo,
      mensagem,
      backgroundColor: AppColors.primary,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }

  // Criação de usuário
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

  // Login do usuário
  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      storeToken();  // Armazena o token após login
    } catch (e) {
      showSnack('Erro ao fazer login', 'Tente novamente');
    }
  }

  // Logout do usuário
  Future<void> logout() async {
    try {
      await _auth.signOut();
      await _storage.delete(key: 'firebase_token');  // Remove o token armazenado
    } catch (e) {
      showSnack('Erro ao fazer logout', e.toString());
    }
  }

  // Armazena o token no Flutter Secure Storage
  Future<void> storeToken() async {
    if (user != null) {
      String? token = await user!.getIdToken();
      if (token != null) {
        await _storage.write(key: 'firebase_token', value: token);
      }
    }
  }
}
