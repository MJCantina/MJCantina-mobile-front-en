import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarrinhoVazio extends StatefulWidget {
  const CarrinhoVazio({super.key});

  @override
  State<CarrinhoVazio> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<CarrinhoVazio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: SvgPicture.asset(AppVectors.bagHappy),
                  ),
                  const SizedBox(height: 2),
                  Text('Sua sacola está vazia!', style: AppFonts.textFont(context)),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            alignment: Alignment.bottomCenter,
            child: BasicAppButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              title: 'Voltar',
            ),
          ),
        ],
      ),
    );
  }
}