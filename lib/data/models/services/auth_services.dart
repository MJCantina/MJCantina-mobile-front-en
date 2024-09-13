import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/presentation/main_pages/home/home.dart';
import 'package:cantina_senai/presentation/splash/splashscreen.dart';
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

  // Verifica o estado de autenticação e navega para a tela apropriada
  ever(_firebaseUser, (User? user) {
    if (user != null && user.emailVerified) {
      userIsAuthenticated.value = true;
      Get.offAll(const HomePage(),
        transition: Transition.rightToLeft,
        duration: const Duration(seconds: 1, milliseconds: 500),
      );
    } else if (user == null) {
      userIsAuthenticated.value = false;
      Get.offAll(const SplashPage(),
        transition: Transition.rightToLeft,
        duration: const Duration(seconds: 1, milliseconds: 500),
      );
    }
  });
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
      await user.sendEmailVerification();

      // Mostrar snackbar informando que o código de confirmação foi enviado
      showSnack('Confirmação', 'Código de confirmação enviado. Verifique seu e-mail.');

      // Atualize o usuário com o e-mail de verificação enviado
      await user.reload();
      user = _auth.currentUser;

      // Mostrar indicador de progresso
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      // Verifique periodicamente se o e-mail foi confirmado
      while (!user!.emailVerified) {
        await Future.delayed(const Duration(seconds: 5)); // Aguarde 5 segundos entre as verificações
        await user.reload(); // Recarregue o estado do usuário
        user = _auth.currentUser; // Atualize o usuário com o novo estado
      }

      // Fechar o indicador de progresso
      Get.back(); // Fecha o diálogo de loading

      // Agora que o e-mail foi confirmado, armazene o token
      await storeToken();  // Armazena o token após confirmação do e-mail
      _firebaseUser.value = _auth.currentUser; // Atualize o estado do usuário

      // Redirecionar para a HomePage
      Get.offAll(const HomePage(),
        transition: Transition.rightToLeft,
        duration: const Duration(seconds: 1, milliseconds: 500),
      );

      showSnack('Sucesso', 'Usuário criado com sucesso e e-mail confirmado.');
    }
  } catch (e) {
    Get.back(); // Fecha o indicador de progresso em caso de erro
    showSnack('Erro ao criar usuário, tente novamente', e.toString());
  }
}



  // Login do usuário
Future<void> login(String email, String password) async {
  try {
    // Mostrar indicador de progresso
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    // Realizar login
    await _auth.signInWithEmailAndPassword(email: email, password: password);

    // Armazena o token após login
    await storeToken();

    // Fechar o indicador de progresso ao final do login
    Get.back();
    
  } catch (e) {
    // Fechar o indicador de progresso em caso de erro
    Get.back();
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
      await _storage.write(key: 'firebase_token', value: token);
        }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      showSnack('Sucesso', 'Link de redefinição de senha enviado para $email.');
    } catch (e) {
      showSnack('Erro ao enviar link de redefinição de senha', e.toString());
    }
  }
}
