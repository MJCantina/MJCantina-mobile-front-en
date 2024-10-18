import 'package:cantina_senai/common/widgets/bottom_bar/bottombar.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/presentation/autentica%C3%A7%C3%A3o/confirmation/confirmation.dart';
import 'package:cantina_senai/presentation/autentica%C3%A7%C3%A3o/end_cadaster/endcadaster.dart';
import 'package:cantina_senai/presentation/splash/splashscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      Get.offAll(const Bottombar(),
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

  User? get user => _firebaseUser.value;
  static AuthService get to => Get.find<AuthService>();

  void showSnack(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.primary,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }

  Future<void> createUser(String email, String password, String name) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password,
      );
      User? user = userCredential.user;

      if (user != null) {
        await user.updateDisplayName(name);
        showSnack('Sucesso', 'Usuário criado com sucesso. Por favor, adicione os dados adicionais.');
        Get.to(const EndCadaster());
      }
    } catch (e) {
      Get.back();
      showSnack('Erro ao criar usuário', e.toString());
    }
  }

  Future<void> salvarInformacoesAdicionais(String telefone, String cpf) async {
  try {
    User? user = _auth.currentUser;

    if (user != null) {
      final query = await FirebaseFirestore.instance
          .collection('users')
          .where('telefone', isEqualTo: telefone)
          .get();

      final cpfQuery = await FirebaseFirestore.instance
          .collection('users')
          .where('cpf', isEqualTo: cpf)
          .get();

      if (query.docs.isNotEmpty || cpfQuery.docs.isNotEmpty) {
        throw Exception('Telefone ou CPF já estão em uso.');
      }

      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'telefone': telefone,
        'cpf': cpf,
      }, SetOptions(merge: true));

      Get.back();

      await user.sendEmailVerification();
      showSnack('Confirmação', 'Código de confirmação enviado. Verifique seu e-mail.');

      Get.to(const ConfirmEmail());

      while (!user!.emailVerified) {
      await Future.delayed(const Duration(seconds: 1));
      await user.reload();
      user = _auth.currentUser; // Atualiza o usuário
      print('Email verificado: ${user?.emailVerified}'); 
      print('verificando...');
      if (user!.emailVerified) {
        userIsAuthenticated.value = true;
        storeToken();
        _firebaseUser.value = user;
        print('pronto');
        break;
      }
    }

    }
  } catch (e) {
    Get.back();
    showSnack('Erro ao salvar dados', e.toString());
  }
}


  Future<void> login(String email, String password) async {
    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await storeToken();
      Get.back();
    } catch (e) {
      Get.back();
      showSnack('Erro ao fazer login', 'Tente novamente');
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


  Future<String?> getPhoneNumber() async {
  try {
    User? user = _auth.currentUser; 

    if (user != null) {

      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (doc.exists) {
        return doc['telefone'] as String?;
      }
    }
    return null;
  } catch (e) {
    showSnack('Erro ao obter telefone', e.toString());
    return null;
  }
}

}