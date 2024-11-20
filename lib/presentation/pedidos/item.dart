import 'package:cantina_senai/common/widgets/base_button/buttonItem.dart';
import 'package:cantina_senai/common/widgets/base_button/counter.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_images.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obter o tamanho da tela
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Stack(  // Usando Stack para empilhar a imagem e o botão
            clipBehavior: Clip.none,
            children: [
              // Imagem de fundo
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.525, // Ajusta a altura da imagem com base no tamanho da tela
                child: Image.asset(
                  AppImages.imgBurguer,
                  fit: BoxFit.cover,
                ),
              ),
              // IconButton sobrepondo a imagem
              Positioned(
                top: screenHeight * 0.045, // Ajuste para colocar o ícone no topo
                left: screenWidth * 0.02, // Ajuste para colocar o ícone à esquerda
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white), // Cor do ícone
                ),
              ),
              // Restante do conteúdo, abaixo da imagem
              Positioned(
                top: screenHeight * 0.45,  // Ajusta com base no tamanho da tela
                left: 5,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container para o conteúdo
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1), // Sombra fraca
                            blurRadius: 10, // Suavidade da borda
                            spreadRadius: 3, // Espalhamento da sombra
                            offset: Offset(0, 3), // Deslocamento da sombra (x, y)
                          ),
                        ],
                      ),
                      width: screenWidth * 0.35, // Tornando o width responsivo
                      height: screenHeight * 0.09,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'R\$',
                                style: AppFonts.textFont(context),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '9,20',
                                style: AppFonts.titleFont(context),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02,),
                    Container(
                      margin: const EdgeInsets.all(0),
                      width: screenWidth * 0.5, // Ajustando a largura do botão
                      height: screenHeight * 0.09,
                      child: ButtonItem(
                        onPressed: () {},
                        title: 'Adicionar ao carrinho',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Adicionando SizedBox responsivo com base na altura da tela
          SizedBox(height: screenHeight * 0.1),
          
          // Texto X-Salada
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Adicionando padding dinâmico
            child: Text(
              'X-SALADA',
              style: AppFonts.titleField(context),
              textAlign: TextAlign.left, // Alinhando o texto à esquerda
            ),
          ),
          // Descrição do X-Salada
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Adicionando padding dinâmico
            child: Text(
              'O X-Salada é um sanduíche delicioso com hambúrguer, alface, tomate, maionese e pão macio, perfeito para quem busca um lanche saboroso. Variações incluem queijo, ovo frito ou batata palha, tornando-o ainda mais irresistível.',
              style: AppFonts.textFontMin(context),
              textAlign: TextAlign.left, // Alinhando o texto à esquerda
            ),
          ),
          // Adicionando outro SizedBox responsivo com base na altura da tela
          SizedBox(height: screenHeight * 0.1),
          CounterButton(onPressed: () {}, title: 'Contador de Produtos'),
        ],
      ),
    );
  }
}
