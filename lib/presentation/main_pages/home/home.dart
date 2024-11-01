import 'package:cantina_senai/common/widgets/appbar/homebar.dart';
import 'package:cantina_senai/common/widgets/base_button/favorite_button.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_images.dart';
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
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: HomeBar(
          userName: AuthService.to.user?.displayName,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Últimos pedidos',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Cardápio',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index == categories.length - 1 ? 16.0 : 10.0,
                      left: index == 0 ? 16 : 0,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFEDED),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        categories[index]['name'],
                        style: AppFonts.category,
                      ),
                    ),
                  );
                },
              ),
            ),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: SizedBox(
                            width: size.width * 0.35,
                            child: Image.asset(AppImages.burger),
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: size.width * 0.65 - 44,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'X-salada',
                                    style: AppFonts.boldtitle,
                                  ),
                                  FavoriteButton(onPressed: () {
                                    
                                  }),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text(
                                  'Feito com pão, hamburguer de carne, queijo, alface e tomate',
                                  style: AppFonts.textDesc,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'R\$10,00',
                                    style: AppFonts.titleField,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      overlayColor: AppColors.grey,
                                      backgroundColor: AppColors.primary,
                                      minimumSize: const Size(0, 30),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      'Add ao carrinho',
                                      style: AppFonts.labelWhite,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
