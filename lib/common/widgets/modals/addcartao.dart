import 'package:cantina_senai/data/models/payment/payment_service.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void addCartao(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    enableDrag: true,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      final maskFormatter = MaskTextInputFormatter(
        mask: '##/##', // Máscara para data MM/AA
        filter: {"#": RegExp(r'[0-9]')},
      );

      final PageController _pageController = PageController(viewportFraction: 0.9);
      final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());
      final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

      final List<String> labels = [
        'Número do cartão',
        'Nome impresso',
        'Data de validade (MM/AA)',
        'CVV'
      ];

      String nomeCartao = '';
      String numCartao = '';
      final paymentController = Get.find<PaymentController>();

      return StatefulBuilder(
        builder: (context, setState) {
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 100,
                      height: 5,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    // Título
                    Text(
                      'Adicionar cartão de Crédito',
                      style: AppFonts.titleFont(context),
                    ),
                    SizedBox(height: 24),

                    // Cartão visual
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.orange.shade400,
                            Colors.orange.shade800,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: Text(
                              'Crédito',
                              style: AppFonts.boldtitle(context)
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 42),
                          Text(
                            numCartao.isEmpty ? 'Número do cartão' : numCartao,
                            style: AppFonts.boldtitle(context)
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                nomeCartao.isEmpty
                                    ? 'Nome impresso'
                                    : nomeCartao,
                                style: AppFonts.boldtitle(context)
                                    .copyWith(color: Colors.white),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                  Icons.credit_card,
                                  color: Colors.orange.shade200,
                                  size: 48,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 12),

                    // Listagem dos campos de entrada
                    SizedBox(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: TextFormField(
                                  controller: _controllers[index],
                                  focusNode: _focusNodes[index],
                                  maxLength: index == 2 ? 5 : (index == 3 ? 4 : 26),
                                  keyboardType: index == 1
                                      ? TextInputType.text
                                      : TextInputType.number,
                                  inputFormatters: index == 1
                                      ? []
                                      : (index == 2
                                          ? [maskFormatter]
                                          : [FilteringTextInputFormatter.digitsOnly]),
                                  onChanged: (value) {
                                    setState(() {
                                      if (index == 0) numCartao = value;
                                      if (index == 1) nomeCartao = value;
                                    });
                                  },
                                  onEditingComplete: () {
                                    if (index < 3) {
                                      _pageController.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: labels[index],
                                    labelStyle: AppFonts.labelBlack(context),
                                    border: UnderlineInputBorder(),
                                    counterText: '',
                                  ),
                                  style: AppFonts.textFont(context),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () async {
                          // Validações
                          if (_controllers[0].text.length != 16) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Número do cartão inválido!')),
                            );
                            return;
                          }

                          if (_controllers[2].text.length != 5 || !_controllers[2].text.contains('/')) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Data de validade inválida!')),
                            );
                            return;
                          }

                          if (_controllers[3].text.length != 3) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('CVV inválido!')),
                            );
                            return;
                          }
                          
                          try {
                            String? email = '${AuthService.to.user?.email}'; // Defina o email do cliente aqui
                            String cardToken = await paymentController.generateCardToken(
                              cardNumber: _controllers[0].text,
                              cardholderName: _controllers[1].text,
                              expirationMonth: _controllers[2].text.split('/')[0],
                              expirationYear: _controllers[2].text.split('/')[1],
                              securityCode: _controllers[3].text,
                            ); 

                            await paymentController.addCard(
                              email: email,
                              cardToken: cardToken,
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Cartão adicionado com sucesso!')),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Erro ao adicionar cartão. Tente novamente!')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Adicionar cartão',
                          style: AppFonts.buttonText(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
