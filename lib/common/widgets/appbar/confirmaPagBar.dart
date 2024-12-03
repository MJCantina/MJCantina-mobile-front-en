import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:cantina_senai/core/configs/theme/app_images.dart';

class PerfilbarConfirma extends StatelessWidget implements PreferredSizeWidget {
  const PerfilbarConfirma({super.key});

  @override
  Widget build(BuildContext context) {
    var user = AuthService.to.user?.displayName;

    // Pegando o tamanho da tela
    Size size = MediaQuery.of(context).size;

    // Tamanho da imagem de perfil ajustado
    double profileSize = size.width * 0.25;

    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 8.0,
      shadowColor: Colors.black.withOpacity(0.25), 
      
      flexibleSpace: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              AppImages.wavegradient,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: size.height * 0.05, // Ajuste para o ícone de voltar
            left: size.width * 0.03, // Ajuste baseado na largura da tela
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context); // Voltar à página anterior
              },
            ),
          ),
          Positioned(
            top: size.height * 0.1, // Ajuste para a posição da foto de perfil
            left: size.width * 0.05,
            child: Container(
              width: profileSize,
              height: profileSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.white,
                  width: 4,
                ),
              ),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/imgs/profile.png'),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.25, // Ajuste para a posição do nome do usuário
            left: size.width * 0.03,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16, top: 4),
                    child: Text(
                      user ?? 'Usuário',
                      style: AppFonts.titleField(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(200);
}
