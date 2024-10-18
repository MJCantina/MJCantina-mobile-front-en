import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Pedidobutton extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;
  final String icon;

  const Pedidobutton(
      {required this.onPressed,
      required this.title,
      required this.icon,
      super.key});

  @override
  State<Pedidobutton> createState() => _PedidobuttonState();
}

class _PedidobuttonState extends State<Pedidobutton> {
  @override
  Widget build(BuildContext context) {
    var pedido = true;
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
              Row(
                children: [
                  pedido == true ? Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: AppColors.primary,
                            width: 4,
                            style: BorderStyle.solid)),
                  ) : const SizedBox(height: 0,),
                  const SizedBox(width: 12),
                  SvgPicture.asset(widget.icon),
                ],
              )
            ],
          )),
    );
  }
}