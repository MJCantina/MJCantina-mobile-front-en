import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/common/widgets/module/moduleborder.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/data/models/services/cart_controller.dart';
import 'package:cantina_senai/presentation/pagamento/formasPagamento.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartWith extends StatefulWidget {
  const CartWith({super.key});

  @override
  State<CartWith> createState() => _CartWithState();
}

class _CartWithState extends State<CartWith> {

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final size = MediaQuery.of(context).size;
    double padding = size.width * 0.04;


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
                                        child: Text('Qnt: ${cartController.cartItems.length}',
                                            style: AppFonts.cartTxt(context)
                                                .copyWith(fontSize: 12)),
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
                  Get.off(PagamentoPage());
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
