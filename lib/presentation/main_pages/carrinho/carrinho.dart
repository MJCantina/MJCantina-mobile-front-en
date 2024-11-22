import 'package:cantina_senai/common/widgets/modals/cart.dart';
import 'package:cantina_senai/common/widgets/modals/emptycart.dart';
import 'package:cantina_senai/data/models/services/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Importar o GetX para acessar o CartController

void cartItem(BuildContext context) {
  // Obtém a instância do CartController
  final cartController = Get.find<CartController>();

  showModalBottomSheet(
    context: context,
    isDismissible: true,
    enableDrag: true,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final maxHeight = constraints.maxHeight * 0.7;
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(48)),
            child: Container(
              color: Colors.white,
              constraints: BoxConstraints(
                maxHeight: maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 100,
                    height: 5,
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Expanded(
                    child: cartController.cartItems.isEmpty
                        ? CarrinhoVazio() // Carrinho vazio
                        : CartWith(), // Carrinho com produtos
                  )
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
