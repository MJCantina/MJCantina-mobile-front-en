import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Pedidoefetivado extends StatefulWidget {
  const Pedidoefetivado({super.key});

  @override
  State<Pedidoefetivado> createState() => _PedidoefetivadoState();
}

class _PedidoefetivadoState extends State<Pedidoefetivado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
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
                SvgPicture.asset(AppVectors.efective),
                Text('Pedido efetivado',
                    style: GoogleFonts.poppins(
                        fontSize: 32,
                        color: AppColors.white,
                        fontWeight: FontWeight.w700)),
                Text(
                  'Seu pedido está na seção "Pedidos" do APP, \n você pode acompanhar o status do seu \n pedido a qualquer momento.',
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
            padding: const EdgeInsets.all(16),
            child: Wrap(
              runSpacing: 16,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(54),
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: Text(
                    'Preparar agora',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(54),
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: Text(
                    'Deixar para mais tarde',
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