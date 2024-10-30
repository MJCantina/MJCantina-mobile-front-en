import 'package:cantina_senai/presentation/main_pages/carrinho/carrinho.dart';
import 'package:flutter/material.dart';

void cartItem(BuildContext context) {
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
