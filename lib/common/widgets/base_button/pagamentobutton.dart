import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class PagamentoButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final bool isEnabled;  // Novo parâmetro para controle de habilitação do botão
  const PagamentoButton({
    required this.onPressed,
    required this.title,
    this.height,
    required this.isEnabled,  // Adicionando o parâmetro isEnabled
    super.key,
  });

  @override
  State<PagamentoButton> createState() => _PagamentoButtonState();
}

class _PagamentoButtonState extends State<PagamentoButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: widget.isEnabled ? widget.onPressed : null, // Botão desabilitado se isEnabled for false
        style: ElevatedButton.styleFrom(
          overlayColor: AppColors.primary,
          minimumSize: Size.fromHeight(widget.height ?? 54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: widget.isEnabled
              ? AppColors.primary // Cor padrão quando habilitado
              : Colors.grey,  // Cor quando desabilitado
        ),
        child: Text(
          widget.title,
          style: AppFonts.buttonText(context),
        ),
      ),
    );
  }
}
