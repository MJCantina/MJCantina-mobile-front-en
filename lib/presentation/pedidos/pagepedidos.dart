import 'package:cantina_senai/common/widgets/appbar/basicappbar.dart';
import 'package:cantina_senai/common/widgets/base_button/listbutton.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:flutter/material.dart';

class PagePedidos extends StatefulWidget {
  const PagePedidos({super.key});

  @override
  State<PagePedidos> createState() => _PagePedidosState();
}

class _PagePedidosState extends State<PagePedidos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarArrow(namePage: 'Pedidos',),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 12,
              children: [
                Listbutton(onPressed: () {}, title: 'Pedido #75', icon: AppVectors.arrowright,)
              ],
            )
          ],
        ),
      ),
    );
  }
}