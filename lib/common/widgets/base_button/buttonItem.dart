
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
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        overlayColor: AppColors.grey,
        minimumSize: Size(widget.height ?? 54, widget.height ?? 54),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo
        mainAxisSize: MainAxisSize.min, // Ajusta o tamanho do Row ao conteúdo
        children: [
          // Texto centralizado, agora com um Expanded para ajustar o espaço
          Expanded(
            child: Text(
              widget.title,
              style: AppFonts.buttonTextMin(context),
              textAlign: TextAlign.center, // Garantindo que o texto fique centralizado
            ),
          ),
          // Ícone posicionado diretamente após o texto
          Icon(Icons.arrow_forward, size: 25, color: AppColors.white,), // Ícone com tamanho ajustado
        ],
      ),
    );
  }
}
