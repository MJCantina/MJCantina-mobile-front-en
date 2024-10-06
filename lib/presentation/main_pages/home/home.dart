import 'package:cantina_senai/common/widgets/appbar/homebar.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  
  List<Map> categories = [
    {'name': 'Salgados'},
    {'name': 'Bebidas'},
    {'name': 'Lanches'},
    {'name': 'Pratos feitos'},
    {'name': 'Sobremesas'},

  ];
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: HomeBar(userName: AuthService.to.user?.displayName,),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Cardapio',
              style: GoogleFonts.poppins(fontSize: 20, color: AppColors.black, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFEDED),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(categories[index]['name'],
                    style: AppFonts.category),
                  ),
                );
              }

            ),
          )
        ],
      ),
    );
  }
}