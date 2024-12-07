import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart'; // Para acessar a área de transferência

class CopyPixCodeButton extends StatelessWidget {
  final String pixCode;

  // Construtor para receber o código PIX
  const CopyPixCodeButton({super.key, required this.pixCode});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          overlayColor: AppColors.primary,
          minimumSize: Size.fromHeight(54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor:  AppColors.white // Cor padrão quando habilitado
        ),
      onPressed: () {
        Clipboard.setData(ClipboardData(text: pixCode)).then((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Código PIX copiado para a área de transferência')),
          );
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppVectors.copy, color: AppColors.black,),
          SizedBox(width: 16,),
          Text('COPIAR CÓDIGO', style: AppFonts.boldtitle(context),)
        ],
      )
    );
  }
}
