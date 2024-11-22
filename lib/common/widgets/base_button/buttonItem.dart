import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class ButtonItem extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final double? width; // Novo parâmetro para ajustar a largura
  const ButtonItem({
    required this.onPressed,
    required this.title,
    this.height,
    this.width, // Recebe a largura do botão
    super.key,
  });

  @override
  State<ButtonItem> createState() => _ButtonItemState();
}

class _ButtonItemState extends State<ButtonItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Sombra fraca
            blurRadius: 10, // Suavidade da borda
            spreadRadius: 5, // Espalhamento da sombra
            offset: Offset(0, 3), // Deslocamento da sombra (x, y)
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          overlayColor: AppColors.grey,
          minimumSize: Size(widget.width ?? 54, widget.height ?? 54),
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo
          mainAxisSize: MainAxisSize.min, // Ajusta o tamanho do Row ao conteúdo
          children: [
            Expanded(
              child: Text(
                widget.title,
                style: AppFonts.buttonTextMin(context),
                textAlign: TextAlign.center, // Garantindo que o texto fique centralizado
              ),
            ),
            Icon(
              Icons.arrow_forward,
              size: 25,
              color: AppColors.white, // Ícone com tamanho ajustado
            ),
          ],
        ),
      ),
    );
  }
}
