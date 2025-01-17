import 'package:cantina_senai/common/widgets/appbar/perfilbar.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:cantina_senai/presentation/configuration/configurations.dart';
import 'package:cantina_senai/presentation/main_pages/favoritos/favorite_page.dart';
import 'package:cantina_senai/presentation/main_pages/perfil/profile_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: const Perfilbar(),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Gerenciar conta',
                    style: AppFonts.titleField(context),
                  ),
                ),
                SizedBox(
                  width: screenWidth - 32,
                  child: cardPerfil(
                    context: context, // Passando o BuildContext
                    icon: AppVectors.profilered,
                    title: 'Perfil',
                    subtitle: 'Preencha ou edite as informações do seu perfil',
                    onTap: () {
                      Get.to(
                        const ProfileConfigs(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(seconds: 1),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SizedBox(
                  width: (screenWidth - 48) / 2,
                  child: cardPerfil(
                    context: context,
                      icon: AppVectors.coracaored,
                      title: 'Favoritos',
                      subtitle: 'Aqui estão os seus produtos favoritos',
                      onTap: () {
                        Get.to(const FavoritePage(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(seconds: 1));
                      }),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: (screenWidth - 48) / 2,
                  child: cardPerfil(
                    context: context,
                      icon: AppVectors.walletred,
                      title: 'Pagamento',
                      subtitle: 'Edite seus métodos de pagamento',
                      onTap: () {
                        Get.to(
                          const Configurations(),
                          transition: Transition.rightToLeft,
                          duration: const Duration(seconds: 1));
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: cardPerfil(
              context: context,
                icon: AppVectors.configred,
                title: 'Configurações',
                subtitle: 'Altere as configurações do seu jeito',
                onTap: () {
                  Get.to(
                    const Configurations(),
                    transition: Transition.rightToLeft,
                    duration: const Duration(seconds: 1));
                }),
          )
        ]),
      ),
    );
  }
}

Widget cardPerfil({
  required BuildContext context,
  required String icon,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: -2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(icon),
          const SizedBox(height: 12),
          Text(
            title,
            style: AppFonts.titleField(context),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: AppFonts.textDesc(context),
          ),
        ],
      ),
    ),
  );
}
