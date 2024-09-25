import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Modulelist extends StatefulWidget {
  const Modulelist({super.key});

  @override
  State<Modulelist> createState() => _ModulelistState();
}

class _ModulelistState extends State<Modulelist> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {  },
      style: ButtonStyle(),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Color(0xeeeeeeff), width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pedido #547 está pronto',
                style: AppFonts.textFont,
              ),
              SvgPicture.asset(
                AppVectors.carteira,
              )
            ],
          ),
        ),
      ),
    );
  }
}
