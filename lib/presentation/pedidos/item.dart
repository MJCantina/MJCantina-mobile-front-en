import 'package:cantina_senai/common/widgets/base_button/buttonItem.dart';
import 'package:cantina_senai/common/widgets/base_button/counter.dart';
import 'package:cantina_senai/common/widgets/base_button/favorite_button.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Recuperar o produto passado como argumento
    final product = Get.arguments as Map<String, dynamic>;

    // Obter o tamanho da tela
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Imagem de fundo
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.525,
                child: Image.network(
                  product['imageUrl'], // Usar a URL do produto
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Text('Erro ao carregar imagem'),
                  ),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                ),
              ),

              // Botão voltar
              Positioned(
                top: screenHeight * 0.045,
                left: screenWidth * 0.02,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
              ),
              // Preço e botão adicionar
              Positioned(
                top: screenHeight * 0.475,
                left: screenWidth * 0.06,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      width: screenWidth * 0.35,
                      height: screenHeight * 0.075,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'R\$',
                                style: AppFonts.textFont(context),
                              ),
                              SizedBox(width: screenWidth * 0.0),
                              Text(
                                product['price'].toString(),
                                style: AppFonts.titlePrice(context),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Container(
                      margin: const EdgeInsets.all(0),
                      width: screenWidth * 0.5,
                      height: screenHeight * 0.075,
                      child: ButtonItem(
                        onPressed: () {
                          // Adicionar lógica de adicionar ao carrinho
                        },
                        title: 'Adicionar ao carrinho',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.1),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product['title'], // Nome do produto
                  style: AppFonts.titleField(context),
                  textAlign: TextAlign.left,
                ),
                FavoriteButton(productId: product['id'],),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Text(
              product['description'], // Descrição do produto
              style: AppFonts.textFontMin(context),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: screenHeight * 0.1),
          CounterButtonItem(
            onPressed: () {},
            title: 'Contador de Produtos',
          ),
        ],
      ),
    );
  }
}
