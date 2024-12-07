import 'package:cantina_senai/core/configs/theme/app_images.dart';
import 'package:flutter/material.dart';

class Simpleappbar extends StatefulWidget {
  const Simpleappbar({super.key});

  @override
  State<Simpleappbar> createState() => _SimpleappbarState();
}

class _SimpleappbarState extends State<Simpleappbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 136, // Altura da AppBar
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          AppImages.wave, // Caminho da imagem no background
          fit: BoxFit.cover, // Ajusta a imagem para cobrir a AppBar
        ),
      )
    );
  }
}