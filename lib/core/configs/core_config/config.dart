import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:cantina_senai/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

Future<void> initConfigurations() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.lazyPut<AuthService>(() => AuthService());
  
}
