import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final TextEditingController campo;
  final String name;
  final String title;
  final double ? height;
  const InputField({
    required this.campo,
    required this.name,
    required this.title,
    this.height,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: AppFonts.titleField),
          SizedBox(height: 16),
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.lightgrey,
              borderRadius: BorderRadius.circular(15)
            ),
            child: TextField(
              controller: campo,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 16),
                hintText: title,
                hintStyle: AppFonts.profileDesc,
                border: InputBorder.none,
              ),
          
              style: AppFonts.titleField,
            ),
          ),
        ],
      ),
    );
  }
}