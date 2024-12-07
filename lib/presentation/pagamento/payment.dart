import 'package:cantina_senai/common/widgets/appbar/confirmperfilbar.dart';
import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/common/widgets/module/moduleborder.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_images.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:cantina_senai/data/models/payment/payment_service.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:cantina_senai/data/models/services/cart_controller.dart';
import 'package:cantina_senai/presentation/pagamento/finalscreen/pedidoefetivado.dart';
import 'package:cantina_senai/presentation/pagamento/finalscreen/pix_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, this.paymentOption});

  @override
  State<PaymentPage> createState() => _PaymentPageState();

  final String? paymentOption;
}

class _PaymentPageState extends State<PaymentPage> {
  var user = AuthService.to.user?.displayName;
  var userEmail = AuthService.to.user?.email;

  final cartController = Get.find<CartController>();
  final paymentController = Get.find<PaymentController>();


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
                                Container(
                                  width: screenWidth * 0.25, // Largura do botão
                                  height: screenHeight * 0.04,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.20),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ), // Altura do botão
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: _diminuirItem,
                                        icon: Icon(Icons.remove_circle),
                                        color: AppColors.primary,
                                        iconSize:
                                            screenWidth * 0.04, // Ícone menor
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
                                        iconSize:
                                            screenWidth * 0.04, // Ícone menor  
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    alignment: Alignment.bottomCenter,
                    child: moduleBorder(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Pagamento', style: AppFonts.textFont(context)),
                          Row(
                              children: [
                                Text(
                                  '${widget.paymentOption}', 
                                  style: AppFonts.textFont(context),
                                ),
                                SvgPicture.asset(AppVectors.edit)
                              ],
                            )
                        ],
                      ),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 10),
                    alignment: Alignment.bottomCenter,
                    child: BasicAppButton(
                      onPressed: () {
                        if (widget.paymentOption == 'PIX') {
                          Get.to(PixPage());
                        } else {
                          Get.to(Pedidoefetivado());
                        }
                      },
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
