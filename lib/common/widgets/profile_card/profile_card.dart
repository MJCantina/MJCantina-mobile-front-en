import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConfigChange extends StatefulWidget {
  final String title;
  final String config;
  final VoidCallback onTap;

  const ConfigChange({required this.title, required this.config, required this.onTap, super.key});

  @override
  State<ConfigChange> createState() => _ConfigChangeState();
}

class _ConfigChangeState extends State<ConfigChange> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: AppColors.bordergrey,
                width: 1,
                style: BorderStyle.solid)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: AppFonts.titleField,
                  ),
                  Text(
                    widget.config,
                    style: AppFonts.subtitle,
                  ),
                ],
              ),
              SvgPicture.asset(AppVectors.arrowright)
            ],
          ),
        ),
      ),
    );
  }
}
