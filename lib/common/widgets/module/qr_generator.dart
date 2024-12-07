import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeViewer extends StatefulWidget {
  final String pixCode; // Novo parâmetro para controle de habilitação do botão
const QrCodeViewer({
    required this.pixCode, // Adicionando o parâmetro isEnabled
    super.key,
  });

  @override
State<QrCodeViewer> createState() => _QrCodeViewerState();
}

class _QrCodeViewerState extends State<QrCodeViewer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Container(
      
      padding: EdgeInsets.all(size.width * 0.05),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white
      ),
      child: QrImageView(
        data: widget.pixCode,
        version: QrVersions.auto,
        size: size.width * 0.6,
        eyeStyle: QrEyeStyle(eyeShape: QrEyeShape.square, color: Colors.black),
        backgroundColor: AppColors.white,
        ),
    );
  }
}
