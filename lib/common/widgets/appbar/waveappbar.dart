import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cantina_senai/core/configs/theme/app_images.dart';

class WaveAppbar extends StatelessWidget implements PreferredSizeWidget {
  const WaveAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Obtém o tamanho da tela

    return Container(
      height: size.height * 0.158, // 15% da altura da tela
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.wavegradient),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
              size: size.width * 0.06, // Tamanho do ícone proporcional à largura da tela
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(158); // Retorna o valor de altura 0 pois a altura é gerenciada no build
}
