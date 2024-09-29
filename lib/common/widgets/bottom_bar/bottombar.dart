import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:cantina_senai/presentation/configuration/configurations.dart';
import 'package:cantina_senai/presentation/main_pages/home/home.dart';
import 'package:cantina_senai/presentation/main_pages/perfil/perfil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Importa o pacote flutter_svg
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:animations/animations.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  BottombarState createState() => BottombarState();
}

class BottombarState extends State<Bottombar> {
  var currentIndex = 1;

  // Lista de páginas a serem exibidas
  final List<Widget> pages = [
    const Configurations(),
    const HomePage(),
    const Perfil(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double iconSize = size.width * .16;
    double largeIconSize = iconSize;
    double smallIconSize = iconSize / 2;

    return Scaffold(
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: pages[currentIndex],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceAround, // Espaçamento igual ao redor dos itens
          children: List.generate(
            listOfSvgAssets.length,
            (index) => InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: SvgPicture.asset(
                listOfSvgAssets[index],
                color: index == currentIndex
                    ? AppColors.primary
                    : AppColors.iconColor,
                width: index == 1
                    ? largeIconSize
                    : smallIconSize, // Ajusta o tamanho com base no índice
                height: index == 1 ? largeIconSize : smallIconSize,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> listOfSvgAssets = [
    AppVectors.wallet,
    AppVectors.meiobottom,
    AppVectors.user,
  ];
}
