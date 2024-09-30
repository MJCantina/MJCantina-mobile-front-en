import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cantina_senai/core/configs/theme/app_images.dart';

class Perfilbar extends StatelessWidget implements PreferredSizeWidget {
  const Perfilbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 180,// Altura da AppBar
      flexibleSpace: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              AppImages.wavegradient, // Caminho da imagem no background
              fit: BoxFit.fitWidth, // Ajusta a imagem para cobrir a AppBar
            ),
          ),
          Positioned(
            top: 72,
            left: 16,
            child: Container(
              width: 104,
              height: 104,
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Define como circular
                border: Border.all(
                  color: AppColors.white, // Cor da borda
                  width: 4, // Espessura da borda
                ),
              ),
              child: const CircleAvatar(
                backgroundColor: AppColors.grey,
              ),
            )
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(180);
}
