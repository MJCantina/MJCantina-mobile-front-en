import 'package:cantina_senai/common/widgets/appbar/perfilbar.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:cantina_senai/presentation/configuration/configurations.dart';
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
  var user = AuthService.to.user?.displayName;
  var userEmail = AuthService.to.user?.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Perfilbar(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
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
              ),
<<<<<<< Updated upstream
              Wrap(
                children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.15),
                            blurRadius: 10,
                            spreadRadius: -6,
                            offset: const Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Get.to(const Configurations(),
                              transition: Transition.rightToLeft,
                              duration: const Duration(seconds: 1));
                        },
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AppVectors.user),
                            const SizedBox(height: 12),
                            Text(
                              'Configurações',
                              style: AppFonts.textFont,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Altere as configurações do seu jeito',
                              style: AppFonts.textFont,
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              )
=======
              SizedBox(
                width: screenWidth - 32,
                child: cardPerfil(
                    icon: AppVectors.profilered,
                    title: 'Perfil',
                    subtitle: 'Preencha ou edite as informações do seu perfil',
                    onTap: () {
                      Get.to(
                        const ProfileConfigs(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(seconds: 1));
                    }),
              ),
>>>>>>> Stashed changes
            ],
          ),
        ));
  }
}
