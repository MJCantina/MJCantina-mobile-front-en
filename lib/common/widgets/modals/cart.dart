import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/common/widgets/base_button/counter.dart';
import 'package:cantina_senai/common/widgets/module/moduleborder.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/data/models/services/cart_controller.dart';
import 'package:cantina_senai/presentation/pagamento/payment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartWith extends StatefulWidget {
  const CartWith({super.key});

  @override
  State<CartWith> createState() => _CartWithState();
}

class _CartWithState extends State<CartWith> {
  int _contador = 1;

  void _adicionarItem() {
    setState(() {
      _contador++;
    });
  }

  void _diminuirItem() {
    setState(() {
      if (_contador > 1) {
        _contador--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final size = MediaQuery.of(context).size;
    double screenHeight = MediaQuery.of(context).size.height;
    double padding = size.width * 0.04;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Obx(() {
        final cartItems = cartController.cartItems;
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final product = cartItems[index];
                  int productQuantity = product['quantity'] ?? 1;
                  double productPrice =
                      double.tryParse(product['price'].toString()) ?? 0.0;
                  double totalProductPrice = productPrice * productQuantity;
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: padding,
                      vertical: padding * 0.5,
                    ),
                    child: SizedBox(
                      height: 130,
                      width: size.width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.35,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                product['imageUrl'],
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Text('Erro ao carregar imagem'),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.05),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      product['title'],
                                      style: AppFonts.boldtitle(context),
                                    ),
                                    Text(
                                      'R\$${totalProductPrice.toStringAsFixed(2)}', // Exibindo o preço total (preço * quantidade)
                                      style: AppFonts.boldtitle(context),
                                    )
                                  ],
                                ),
                                Text(
                                  product['description'],
                                  style: AppFonts.placeHolder(context),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Container(
                                        width: screenWidth *
                                            0.25, // Largura do botão
                                        height: screenHeight * 0.04,
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.20),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ), // Altura do botão
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: _diminuirItem,
                                              icon: Icon(Icons.remove_circle),
                                              color: AppColors.primary,
                                              iconSize: screenWidth *
                                                  0.04, // Ícone menor
                                              padding: EdgeInsets.zero,
                                            ),
                                            Text(
                                              '$_contador', // Mostra a quantidade
                                              style: TextStyle(
                                                fontSize: screenWidth *
                                                    0.025, // Texto menor
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              overflow: TextOverflow
                                                  .ellipsis, // Evitar overflow no texto
                                            ),
                                            IconButton(
                                              onPressed: _adicionarItem,
                                              icon: Icon(Icons.add_circle),
                                              color: AppColors.primary,
                                              iconSize: screenWidth *
                                                  0.04, // Ícone menor
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          cartController
                                              .removeFromCart(product);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          overlayColor: AppColors.grey,
                                          backgroundColor: AppColors.primary,
                                          minimumSize:
                                              Size(size.width * 0.025, 35),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: Text('Remover',
                                            style: AppFonts.cartTxt(context)
                                                .copyWith(fontSize: 12)),
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.bottomCenter,
              child: moduleBorder(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: AppFonts.boldtitle(context)),
                    Obx(() {
                      final totalPrice = cartController.total;
                      return Text(
                        'R\$${totalPrice.toStringAsFixed(2)}', // Exibe o total final calculado no CartController
                        style: AppFonts.boldtitle(context),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
              alignment: Alignment.bottomCenter,
              child: BasicAppButton(
                onPressed: () {
                  Get.off(PaymentPage());
                },
                title: 'Comprar',
              ),
            ),
          ],
        );
      }),
    );
  }
}
