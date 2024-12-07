import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_images.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:cantina_senai/presentation/pedidos/pagepedidos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeBar extends StatelessWidget implements PreferredSizeWidget {
  final String? userName;
  final TextEditingController searchController;

  const HomeBar({
    required this.userName,
    required this.searchController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hour = now.hour;

    var pedido = true;

    String greeting;
    if (hour >= 5 && hour < 12) {
      greeting = 'Bom dia!';
    } else if (hour >= 12 && hour < 18) {
      greeting = 'Boa tarde!';
    } else {
      greeting = 'Boa noite!';
    }

    return AppBar(
      toolbarHeight: 280, // Altura da AppBar
      flexibleSpace: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              AppImages.wave, 
              fit: BoxFit.fitWidth, 
            ),
          )
        ],
      ),
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Olá, ${userName ?? 'Usuário'}', // Se o nome do usuário for nulo, exibe 'Usuário'
                    style: AppFonts.subtitle(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(greeting, style: AppFonts.titleFont(context)),
                      IconButton(
                        onPressed: () {
                          Get.to(
                            const PagePedidos(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(seconds: 1),
                          );
                        },
                        icon: pedido
                            ? SvgPicture.asset(AppVectors.pedidosred)
                            : SvgPicture.asset(AppVectors.pedidos),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightgrey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Procurar por produto',
                    hintStyle: AppFonts.placeHolder(context),
                    border: InputBorder.none,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 12, right: 8),
                      child: Icon(
                        Icons.search, // Ícone de pesquisa
                        color: Colors.grey,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                  style: AppFonts.textHolder(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(280);
}
