import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConfigChange extends StatefulWidget {
  final String title;
  final String config;
  final VoidCallback onPressed;

  const ConfigChange({required this.title, required this.config, required this.onPressed, super.key});

  @override
  State<ConfigChange> createState() => _ConfigChangeState();
}

class _ConfigChangeState extends State<ConfigChange> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
              overlayColor: AppColors.grey,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                side: BorderSide(
                  color: AppColors.bordergrey,
                  width: 1,
                ),
              ),
            ),
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
                      style: AppFonts.placeHolder,
                    ),
                  ],
                ),
                SvgPicture.asset(AppVectors.arrowright)
              ],
            ),
        ),
    );
  }
}
