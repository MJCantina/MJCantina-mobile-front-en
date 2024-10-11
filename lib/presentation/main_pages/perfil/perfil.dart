import 'package:cantina_senai/common/widgets/appbar/perfilbar.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:cantina_senai/presentation/configuration/configurations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  var user = AuthService.to.user?.displayName;
  var userEmail = AuthService.to.user?.email;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const Perfilbar(),
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user!,
                      style: AppFonts.titleField.copyWith(fontSize: 20),
                    ),
                    Text(userEmail!,
                        style: AppFonts.placeHolder.copyWith(fontSize: 12)),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                width: (screenWidth - 48) / 2,
                child: cardPerfil(
                    icon: AppVectors.configred,
                    title: 'Último pedido',
                    subtitle: 'Toque aqui para pedir novamente',
                    onTap: () {
                      Get.to(Configurations(),
                          transition: Transition.rightToLeft,
                          duration: Duration(seconds: 1));
                    }),
              ),
              SizedBox(width: 16),
              Container(
                width: (screenWidth - 48) / 2,
                child: cardPerfil(
                    icon: AppVectors.coracaored,
                    title: 'Favoritos',
                    subtitle: 'Aqui está seus produtos favoritos',
                    onTap: () {
                      Get.to(Configurations(),
                          transition: Transition.rightToLeft,
                          duration: Duration(seconds: 1));
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text('Gerenciar conta', style: AppFonts.titleField,),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                width: (screenWidth - 48) / 2,
                child: cardPerfil(
                    icon: AppVectors.profilered,
                    title: 'Perfil',
                    subtitle: 'Preencha ou edite as informações do seu perfil',
                    onTap: () {
                      Get.to(Configurations(),
                          transition: Transition.rightToLeft,
                          duration: Duration(seconds: 1));
                    }),
              ),
              SizedBox(width: 16),
              Container(
                width: (screenWidth - 48) / 2,
                child: cardPerfil(
                    icon: AppVectors.walletred,
                    title: 'Metódos de pagamento',
                    subtitle: 'Edite seus métodos de pagamento',
                    onTap: () {
                      Get.to(Configurations(),
                          transition: Transition.rightToLeft,
                          duration: Duration(seconds: 1));
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: cardPerfil(
            icon: AppVectors.configred,
            title: 'Configurações',
            subtitle: 'Altere as configurações do seu jeito',
            onTap: () {
              Get.to(
                Configurations(),
                transition: Transition.rightToLeft,
                duration: Duration(seconds: 1)
              );
            }),
        )
      ]),
    );
  }
}

Widget cardPerfil({
  required String icon,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              spreadRadius: -2,
              offset: const Offset(0, 1),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(icon),
          const SizedBox(height: 12),
          Text(
            title,
            style: AppFonts.titleField,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: AppFonts.textDesc,
          )
        ],
      ),
    ),
  );
}
