import 'package:cantina_senai/common/widgets/appbar/homebar.dart';
import 'package:cantina_senai/common/widgets/bottom_bar/bottombar.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: HomeBar(userName: AuthService.to.user?.displayName,),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Últimos pedidos',
              style: GoogleFonts.poppins(fontSize: 20, color: AppColors.black, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Bottombar(),
    );
  }
}