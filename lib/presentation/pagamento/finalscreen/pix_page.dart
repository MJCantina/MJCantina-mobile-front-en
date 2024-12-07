import 'package:cantina_senai/common/widgets/base_button/pix_copy.dart';
import 'package:cantina_senai/common/widgets/bottom_bar/bottombar.dart';
import 'package:cantina_senai/common/widgets/module/qr_generator.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PixPage extends StatefulWidget {
  const PixPage({super.key});

  @override
  State<PixPage> createState() => _PixPageState();
}

class _PixPageState extends State<PixPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PIX QR CODE',
                  style: GoogleFonts.poppins(
                      fontSize: 32,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 24,),
                QrCodeViewer(pixCode: '04930420343024e23402942e42e42394230'),
                Padding(
                  padding:  EdgeInsets.all(size.width * 0.15),
                  child: Column(
                    children: [
                      CopyPixCodeButton(pixCode: '04930420343024e23402942e42e42394230'),
                      SizedBox(height: 8,),
                      Text('Expira em 15 minutos', style: AppFonts.removeText(context),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              runSpacing: 16,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.offAll(Bottombar());
                  },
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
