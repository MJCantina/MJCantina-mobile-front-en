import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

// Importando seus arquivos de tema personalizados
import 'package:cantina_senai/core/configs/theme/app_images.dart';
import 'package:get/get.dart';

class AppBarArrow extends StatelessWidget implements PreferredSizeWidget {

  const AppBarArrow({ 
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
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: Icon(Icons.arrow_back_ios),
        ), color: AppColors.white, 
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(135); 
}