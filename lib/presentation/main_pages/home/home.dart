import 'package:cantina_senai/common/widgets/appbar/homebar.dart';
import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/common/widgets/base_button/favorite_button.dart';
import 'package:cantina_senai/common/widgets/base_button/profilebutton.dart';
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
                        fontWeight: FontWeight.w600),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Cardapio',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600),
                  ),
                )),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        right: index == categories.length - 1 ? 16.0 : 10.0,
                        left: index == 0 ? 16 : 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
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
            SizedBox(
              width: size.width,
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 140,
                      width: size.width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.4,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  AppImages.burger,
                                  fit: BoxFit.cover,
                                )),
                          ), // Exemplo com largura de 10 (ajuste conforme necessário)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'X-Salada',
                                              style: AppFonts.boldtitle,
                                            ),
                                            FavoriteButton(
                                              onPressed: () {},
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: size.width * 0.5,
                                          child: Text(
                                            'feito com pão, carne,  queijo, alface e tomate', // Corrigi a ortografia de "alface"
                                            style: AppFonts.placeHolder,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'R\$9,00',
                                      style: AppFonts.titleField,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          overlayColor: AppColors.grey,
                                          backgroundColor: AppColors.primary,
                                          minimumSize: Size(32, 32),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      child: Icon(
                                        Icons.add_shopping_cart_outlined,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
