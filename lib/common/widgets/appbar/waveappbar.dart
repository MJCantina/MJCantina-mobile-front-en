import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

// Importando seus arquivos de tema personalizados
import 'package:cantina_senai/core/configs/theme/app_images.dart';

class WaveAppbar extends StatelessWidget implements PreferredSizeWidget {

  const WaveAppbar({ 
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 128, // Altura da AppBar
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          AppImages.wavegradient, // Caminho da imagem no background
          fit: BoxFit.cover, // Ajusta a imagem para cobrir a AppBar
        ),
      ),

      leading:IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: const Icon(Icons.arrow_back_ios, color: AppColors.white,
      ),
      ), 
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(128); 
}