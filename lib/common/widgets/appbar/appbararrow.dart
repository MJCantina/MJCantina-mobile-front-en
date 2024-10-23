import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:flutter/material.dart';

// Importando seus arquivos de tema personalizados
import 'package:cantina_senai/core/configs/theme/app_images.dart';
import 'package:get/get.dart';

class AppBarArrow extends StatelessWidget implements PreferredSizeWidget {
  final String namePage;
  const AppBarArrow({required this.namePage ,super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 196,
        flexibleSpace: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.wave, // Caminho da imagem no background
                fit: BoxFit.fitWidth, // Ajusta a imagem para cobrir a AppBar
              ),
            )
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Icon(Icons.arrow_back_ios),
          ),
          color: AppColors.white,
        ),
        bottom: PreferredSize(
          preferredSize: preferredSize,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Align(
              alignment: Alignment.centerLeft, // Alinha o título à esquerda
              child: Text(
                namePage,
                style: AppFonts.titleFont,
              ),
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(196);
}
