import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final TextEditingController campo;
  final String name;
  final String title;
  final String? Function(String?) validator;
  
  const InputField({
    required this.campo,
    required this.name,
    required this.title,
    required this.validator,
    super.key
    
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: AppFonts.titleField),
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightgrey,
              borderRadius: BorderRadius.circular(15)
            ),
            child: TextFormField(
              controller: campo,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                hintText: title,
                hintStyle: AppFonts.placeHolder,
                border: InputBorder.none,
                
              ),
              validator: validator,
              
          
              style: AppFonts.textHolder,
            ),
          ),
        ],
      ),
    );
  }
}