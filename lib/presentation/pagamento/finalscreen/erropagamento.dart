import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Erropagamento extends StatefulWidget {
  const Erropagamento({super.key});

  @override
  State<Erropagamento> createState() => _ErropagamentoState();
}

class _ErropagamentoState extends State<Erropagamento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Icon(Icons.arrow_back_ios),
            ),
            color: AppColors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppVectors.error),
                Text('Erro no pagamento',
                    style: GoogleFonts.poppins(
                        fontSize: 32,
                        color: AppColors.white,
                        fontWeight: FontWeight.w700)),
                Text(
                  'Alguma coisa no pagamento não deu \n certo, tente novamente mais tarde ou \n utilize outro meio de pagamento.',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(54),
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Text(
                'Voltar',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}