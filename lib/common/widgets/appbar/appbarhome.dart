
import 'package:flutter/material.dart';

// Importando seus arquivos de tema personalizados
import 'package:cantina_senai/core/configs/theme/app_images.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {

  const BasicAppBar({ 
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 135, // Altura da AppBar
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          AppImages.wave, // Caminho da imagem no background
          fit: BoxFit.cover, // Ajusta a imagem para cobrir a AppBar
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(135); 
}