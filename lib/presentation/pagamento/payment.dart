import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/common/widgets/module/moduleborder.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_images.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:cantina_senai/data/models/payment/payment_service.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:cantina_senai/data/models/services/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, this.paymentMethod});

  @override
  State<PaymentPage> createState() => _PaymentPageState();

  final String? paymentMethod;
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back)),
        scrolledUnderElevation: 8.0,
        shadowColor: Colors.black.withOpacity(0.25),
        toolbarHeight: 244,
        flexibleSpace: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.wavegradient,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
                top: 72,
                left: 16,
                child: Container(
                  width: 104,
                  height: 104,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white,
                      width: 4,
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/imgs/profile.png'),
                  ),
                )),
            Positioned(
              top: 180,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16, top: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user!,
                            style: AppFonts.titleField(context),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
                                  '${widget.paymentMethod}', 
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
                        if (widget.paymentMethod == 'PIX') {
                          paymentController.generatePix(transactionAmount: '${cartController.total}', description: '${cartController.cartItems}', email: '${AuthService.to.user?.email}');
                        } else {
                          
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
