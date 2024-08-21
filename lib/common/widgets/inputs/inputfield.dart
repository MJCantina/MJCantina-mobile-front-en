import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final String title;
  final double ? height;
  const InputField({
    required this.title,
    this.height,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.lightgrey,
          borderRadius: BorderRadius.circular(15)
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 16),
            hintText: title,
            hintStyle: AppFonts.profileDesc,
            border: InputBorder.none,
          ),

          style: AppFonts.titleField,
        ),
      ),
    );
  }
}