import 'package:cantina_senai/common/widgets/appbar/confirmaPagBar.dart';
import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/common/widgets/module/moduleborder.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/presentation/pagamento/paymentchoices.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:cantina_senai/data/models/services/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentPage extends StatefulWidget {
  final String paymentOption;
  const PaymentPage({super.key, required this.paymentOption});

  // Construtor para receber a opção de pagamento
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  var user = AuthService.to.user?.displayName;
  var userEmail = AuthService.to.user?.email;
  final cartController = Get.find<CartController>();

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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PerfilbarConfirma(),
      body: Obx(() {
        final cartItems = cartController.cartItems;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final product = cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product['title'],
                                      style: AppFonts.boldtitle(context),
                                    ),
                                    Text(
                                      'R\$${product['price']}',
                                      style: AppFonts.subtitle(context),
                                    ),
                                  ],
                                ),
                                Text(
                                  '1x',
                                  style: AppFonts.boldtitle(context),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Divider(
                            color: AppColors.grey, // Cor da linha
                            thickness: 1.0, // Espessura da linha
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Column(
                children: [
                  Container(
                    height: screenHeight * 0.135,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    alignment: Alignment.bottomCenter,
                    child: moduleBorder(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Forma:', // Exibe o total final calculado no CartController
                            style: AppFonts.boldtitle(context),
                          ),
                          Row(
                            children: [
                              Text(
                                '${widget.paymentOption}',
                                style: AppFonts.textHolder(context),
                              ),
                              SizedBox(
                                width: screenWidth * 0.01,
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PagamentoPage(),
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.edit_square,color: AppColors.black,)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 10),
                    alignment: Alignment.bottomCenter,
                    child: BasicAppButton(
                      onPressed: () {},
                      title: 'Pagar',
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
