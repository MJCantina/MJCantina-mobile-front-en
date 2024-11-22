import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputField extends StatefulWidget {
  final TextEditingController campo;
  final String name;
  final String title;
  final String? Function(String?) validator;
  final bool isPassword; // Adiciona flag para campos de senha

  const InputField({
    required this.campo,
    required this.name,
    required this.title,
    required this.validator,
    this.isPassword = false, // Valor padrão
    super.key,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obscureText = true; // Controla a visibilidade da senha

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.name, style: AppFonts.titleField(context)),
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightgrey,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              controller: widget.campo,
              obscureText: widget.isPassword ? _obscureText : false, // Oculta senha
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                hintText: widget.title,
                hintStyle: AppFonts.placeHolder(context),
                border: InputBorder.none,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: SvgPicture.asset(
                          (_obscureText ? AppVectors.eyeslash : AppVectors.eye),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    : null,
              ),
              validator: widget.validator,
              style: AppFonts.textHolder(context),
            ),
          ),
        ],
      ),
    );
  }
}
