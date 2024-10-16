import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Listbutton extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;
  final String icon;
  const Listbutton({required this.onPressed, required this.title, required this.icon, super.key});

  @override
  State<Listbutton> createState() => _ListbuttonState();
}

class _ListbuttonState extends State<Listbutton> {
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
          children: [
            Text(
              widget.title,
              style: AppFonts.textFont,
            ),
            SvgPicture.asset(widget.icon), // Ícone sempre presente
          ],
        )),
    );
  }
}
