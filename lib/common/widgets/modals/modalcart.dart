
import 'package:cantina_senai/presentation/main_pages/carrinho/carrinho.dart';
import 'package:flutter/material.dart';

void showCart(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
            initialChildSize: 0.7, // Altura inicial de 65% da tela
            minChildSize: 0.3, // Altura mínima
            maxChildSize: 0.75, // Altura máxima ao expandir
            builder: (context, scrollController) {
              return ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(48)),
                  child: Container(
                    color: Colors.white, // Define a cor de fundo
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 100, // Largura da linha cinza
                          height: 5, // Altura da linha cinza
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300, // Cor da linha
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const Expanded(
                          child: Carrinho(),
                        ),
                      ],
                    ),
                  ),
              );
            },
        );
      },
    );
}