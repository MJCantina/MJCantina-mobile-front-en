import 'package:cantina_senai/common/widgets/appbar/basicappbar.dart';
import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmEmail extends StatefulWidget {
  const ConfirmEmail({super.key});

  @override
  State<ConfirmEmail> createState() => _ConfirmEmailState();
}

class _ConfirmEmailState extends State<ConfirmEmail> {
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
          ), color: AppColors.white, 
                ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              SvgPicture.asset(AppVectors.confirmation),
              Text('Confirme sua conta', style: GoogleFonts.poppins(fontSize: 32, color: AppColors.white, fontWeight: FontWeight.w700)),
              Text('Foi enviado um email de confirmação \n para ativar sua conta. \nAntes de reenviar verifique a caixa de \n span e lixeira.', style: GoogleFonts.poppins(fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w400), textAlign: TextAlign.center,),
            ],
          ),
          
          Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: (){

            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(54),
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
              
              
            ),
            child: Text(
              'Reenviar', style: GoogleFonts.poppins(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w700),
            ),
          ),
        )

        ],
      ),
    );
  }
}