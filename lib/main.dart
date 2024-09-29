import 'package:cantina_senai/core/configs/core_config/config.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:cantina_senai/presentation/splash/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initConfigurations();

  // Inicialize o AuthService
  await initAuthService();

  SystemChrome.setSystemUIOverlayStyle(
  const SystemUiOverlayStyle(
  statusBarColor: AppColors.primary,
  statusBarIconBrightness: Brightness.light,
));


  runApp(const MyApp());
}

Future<void> initAuthService() async {
  Get.put(AuthService());

  // Aguarde o AuthService inicializar
  await Future.delayed(Duration.zero); // Ou qualquer outra lógica de espera que você precisa
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),  // A tela inicial é a SplashPage
    );
  }
}
