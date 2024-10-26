import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

Widget moduleBorder({
  required dynamic child,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: AppColors.bordergrey,
        width: 1,
        style: BorderStyle.solid
      )
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: child,
    ),
  );
}