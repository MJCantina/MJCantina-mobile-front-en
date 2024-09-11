
import 'package:cantina_senai/core/configs/auth_controller/auth_controller.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:flutter/material.dart';

// Importando seus arquivos de tema personalizados
import 'package:cantina_senai/core/configs/theme/app_images.dart';
import 'package:flutter_svg/svg.dart';


class HomeBar extends StatelessWidget implements PreferredSizeWidget {
  final String? userName; // Adiciona uma propriedade para o nome do usuário

  const HomeBar({ 
    super.key,
    this.userName, // Adiciona o nome do usuário como parâmetro
  });

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;




    return AppBar(
      toolbarHeight: 180, // Altura da AppBar
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          AppImages.wave, // Caminho da imagem no background
          height: 135,
          width: size.width,// Ajusta a imagem para cobrir a AppBar
          alignment: Alignment.topCenter,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
             child: Text(
                'Olá, ${userName ?? 'Usuário'}', 
                style: AppFonts.subtitle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Bom dia!', style: AppFonts.titleFont),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          AuthService.to.logout();
                        },
                        icon: SvgPicture.asset(AppVectors.notification),
                      ),
                      Positioned(
                        right: 10, // Ajuste a posição horizontal
                        top: 12, // Ajuste a posição vertical
                        child: Container(
                          width: 10, // Largura da bolinha
                          height: 10, // Altura da bolinha
                          decoration: const BoxDecoration(
                            color: Colors.red, // Cor vermelha para a bolinha
                            shape: BoxShape.circle, // Formato circular
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.lightgrey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    hintText: 'Procurar por produto',
                    hintStyle: AppFonts.subtitle,
                    border: InputBorder.none,
                    prefixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.search, color: Colors.grey,))
                  ),
                  style: AppFonts.titleField,
                ),
                
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(300);
}




