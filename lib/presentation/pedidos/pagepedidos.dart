import 'package:cantina_senai/common/widgets/appbar/appbararrow.dart';
import 'package:cantina_senai/common/widgets/base_button/pedidobutton.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:cantina_senai/presentation/pedidos/detalhepedido.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PagePedidos extends StatefulWidget {
  const PagePedidos({super.key});

  @override
  State<PagePedidos> createState() => _PagePedidosState();
}

class _PagePedidosState extends State<PagePedidos> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarArrow(
          namePage: 'Pedidos',
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    runSpacing: 12,
                    children: [
                      Pedidobutton(
                          onPressed: () {
                            Get.to(const DetalhePedido(),
                                transition: Transition.rightToLeft,
                                duration: const Duration(seconds: 1));
                          },
                          title: 'Pedido #7556',
                          icon: AppVectors.arrowright),
                      Pedidobutton(
                          onPressed: () {
                            Get.to(const DetalhePedido(),
                                transition: Transition.rightToLeft,
                                duration: const Duration(seconds: 1));
                          },
                          title: 'Pedido #7556',
                          icon: AppVectors.arrowright),
                      Pedidobutton(
                          onPressed: () {
                            Get.to(const DetalhePedido(),
                                transition: Transition.rightToLeft,
                                duration: const Duration(seconds: 1));
                          },
                          title: 'Pedido #7556',
                          icon: AppVectors.arrowright),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
