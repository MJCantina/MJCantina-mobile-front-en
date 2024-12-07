import 'package:cantina_senai/common/widgets/appbar/appbararrow.dart';
import 'package:cantina_senai/common/widgets/base_button/listbutton.dart';
import 'package:cantina_senai/common/widgets/modals/deleteuser.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
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
    return SafeArea(
      child: Scaffold(
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
                        title: 'Politicas de uso',
                        icon: AppVectors.arrowright,
                      ),
                      Listbutton(
                        onPressed: () {
                          showPasswordDialog(context);
                        },
                        title: 'Deletar conta',
                        icon: AppVectors.trash,
                      ),
                      Listbutton(
                        onPressed: () {AuthService.to.logout();},
                        title: 'Sair',
                        icon: AppVectors.logout,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: SizedBox(width: double.infinity,child: Text('Versão 0.0.1', style: GoogleFonts.poppins(fontSize: 10, color: AppColors.grey, fontWeight: FontWeight.w400),textAlign: TextAlign.center,)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


void showPasswordDialog(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text("Digite sua senha", style: AppFonts.titleField(context),),
          content: TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              filled: true, 
              fillColor: Colors.grey[200], 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0), 
                borderSide: BorderSide.none, 
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancelar", style: AppFonts.subtitle(context),),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary
              ),
              onPressed: () {
                AuthService.to.deleteUserAccount(passwordController.text);
              },
              child: Text("Confirmar", style: AppFonts.buttonText(context),),
            ),
          ],
        );
      },
    );
  }