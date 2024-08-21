
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:flutter/material.dart';

// Importando seus arquivos de tema personalizados
import 'package:cantina_senai/core/configs/theme/app_images.dart';
import 'package:flutter_svg/svg.dart';

class HomeBar extends StatelessWidget implements PreferredSizeWidget {

  const HomeBar({ 
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
      bottom: PreferredSize(preferredSize: preferredSize, child: Column(
        children: [
          Text('Olá Plinio Cavalcante', style: AppFonts.subtitle,),
          Row(
            children: [
              Text('Bom dia!', style: AppFonts.titleFont,),
              IconButton(onPressed: (){}, icon: SvgPicture.asset(AppVectors.notification))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.lightgrey,
                borderRadius: BorderRadius.circular(15)
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 16),
                  hintText: 'Procurar por produto',
                  hintStyle: AppFonts.profileDesc,
                  border: InputBorder.none,
                  prefixIcon: SvgPicture.asset(AppVectors.search)
                ),
          style: AppFonts.titleField,
        ),
      ),
    )

        ],
      )),
      
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(135); 
}




