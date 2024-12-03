import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:cantina_senai/core/configs/theme/app_images.dart';

class Perfilbar extends StatelessWidget implements PreferredSizeWidget {
  const Perfilbar({super.key});

  @override
  Widget build(BuildContext context) {
    var user = AuthService.to.user?.displayName;
    var userEmail = AuthService.to.user?.email;

    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 8.0,
      shadowColor: Colors.black.withOpacity(0.25), // Cor da sombra com opacidade
      toolbarHeight: 244,
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
                  backgroundImage: AssetImage('assets/imgs/profile.png'),
                ),
              )),
          Positioned(
            top: 180,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16, top: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user!,
                          style: AppFonts.titleField(context),
                        ),
                        Text(userEmail!,
                            style: AppFonts.placeHolder(context)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(244);
}
