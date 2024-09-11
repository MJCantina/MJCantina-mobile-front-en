import 'package:cantina_senai/core/configs/core_config/config.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:cantina_senai/presentation/splash/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initConfigurations();

  // Inicialize o AuthService
  await initAuthService();

  runApp(const MyApp());
}

Future<void> initAuthService() async {
  final authService = Get.put(AuthService());

  // Aguarde o AuthService inicializar
  await Future.delayed(Duration.zero); // Ou qualquer outra lógica de espera que você precisa
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),  // A tela inicial é a SplashPage
    );
  }
}
