import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:cantina_senai/presentation/main_pages/carrinho/carrinho.dart';
import 'package:cantina_senai/presentation/main_pages/home/home.dart';
import 'package:cantina_senai/presentation/main_pages/perfil/perfil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:animations/animations.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  BottombarState createState() => BottombarState();
}

class BottombarState extends State<Bottombar> {
  var currentIndex = 0; // Inicialmente na HomePage

  final List<Widget> pages = [
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
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Espaçamento igual ao redor dos itens
          children: List.generate(
            listOfSvgAssets.length,
            (index) => InkWell(
              onTap: () {
                if (index == 0) {
                  // Exibir o BottomSheet ao clicar no ícone do carrinho
                  _showBottomSheet(context);
                } else {
                  setState(() {
                    currentIndex = index - 1; // Atualiza o índice para as outras páginas
                  });
                }
              },
              child: SvgPicture.asset(
                listOfSvgAssets[index],
                color : index - 1 == currentIndex
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
 void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Permite ajustar a altura do BottomSheet
    backgroundColor: Colors.transparent, // Deixa a cor de fundo transparente
    builder: (context) {
      return GestureDetector(
        onTap: () {
          Navigator.pop(context); // Fecha o BottomSheet ao clicar fora
        },
        child: DraggableScrollableSheet(
          initialChildSize: 0.65, // Altura inicial de 65% da tela
          minChildSize: 0.3, // Altura mínima
          maxChildSize: 0.75, // Altura máxima ao expandir
          builder: (context, scrollController) {
            return GestureDetector(
              onTap: () {}, // Evita fechar o BottomSheet ao clicar dentro dele
              child: ClipRRect(
                
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                child: Container( 
                  color: Colors.white, // Define a cor de fundo
                  child: Carrinho(), // Aqui você coloca seu widget Carrinho
                ),
              ),
            );
          },
        ),
      );
    },
  );
}


  List<String> listOfSvgAssets = [
    AppVectors.wallet, // Carrinho
    AppVectors.meiobottom, // Home
    AppVectors.user, // Perfil
  ];
}
