import 'package:cantina_senai/core/configs/core_config/config.dart';
import 'package:cantina_senai/domain/entities/page_controller.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main () async {
  
  await initConfigurations();
  runApp(const MainPage());
  


}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Checkauth(),
      );
  }
}