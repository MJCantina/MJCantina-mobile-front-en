import 'package:cantina_senai/common/widgets/appbar/basicappbar.dart';
import 'package:cantina_senai/common/widgets/base_button/listbutton.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Configurations extends StatefulWidget {
  const Configurations({super.key});

  @override
  State<Configurations> createState() => _ConfigurationsState();
}

class _ConfigurationsState extends State<Configurations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarArrow(namePage: 'Configurações'),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    Listbutton(
                      onPressed: () {},
                      title: 'Histórico de pedidos',
                      icon: AppVectors.arrowright,
                    ),
                    Listbutton(
                      onPressed: () {},
                      title: 'Segurança',
                      icon: AppVectors.arrowright,
                    ),
                    Listbutton(
                      onPressed: () {},
                      title: 'Ajuda',
                      icon: AppVectors.arrowright,
                    ),
                    Listbutton(
                      onPressed: () {},
                      title: 'Politicas de uso',
                      icon: AppVectors.arrowright,
                    ),
                    Listbutton(
                      onPressed: () {},
                      title: 'Deletar conta',
                      icon: AppVectors.trash,
                    ),
                    Listbutton(
                      onPressed: () {AuthService.to.logout();},
                      title: 'Sair',
                      icon: AppVectors.logout,
                    ),
                    SizedBox(width: double.infinity,child: Text('Versão 0.0.1', style: GoogleFonts.poppins(fontSize: 10, color: AppColors.grey, fontWeight: FontWeight.w400),textAlign: TextAlign.center,))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
