import 'package:cantina_senai/common/widgets/appbar/waveappbar.dart';
import 'package:cantina_senai/common/widgets/base_button/pagamentobutton.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/common/widgets/modals/addCartao.dart';
import 'package:cantina_senai/presentation/pagamento/confirmation.dart';
import 'package:flutter/material.dart';

class PagamentoPage extends StatefulWidget {

  const PagamentoPage({Key? key,}) : super(key: key);
  @override
  State<PagamentoPage> createState() => _PagamentoPageState();
}

class _PagamentoPageState extends State<PagamentoPage> {
  String? _selectedPaymentOption; // Estado para a opção selecionada
  String? _selectedCard; // Estado para o cartão selecionado
  final List<String> _cartoesCadastrados = [
    '092.***.***',
    '093.***.913'
  ]; // Lista de cartões

  void _adicionarCartao() {
    // Função para adicionar um novo cartão
    print("Adicionar novo cartão chamado");
  }

  // Função para alternar a visibilidade do conteúdo ao clicar
  void _toggleSelection(String paymentOption) {
    setState(() {
      if (_selectedPaymentOption == paymentOption) {
        _selectedPaymentOption = null; // Desmarcar se já estiver selecionado
        _selectedCard = null; // Resetar o cartão quando a opção for desmarcada
      } else {
        _selectedPaymentOption = paymentOption; // Marcar a opção selecionada
        _selectedCard =
            null; // Resetar o cartão para forçar a seleção de um novo
      }
    });
  }

  bool get _isConfirmEnabled {
    // O botão "Confirmar" será habilitado quando uma opção de pagamento estiver selecionada
    // Para o "PIX", o botão estará habilitado sem a necessidade de selecionar um cartão
    return _selectedPaymentOption != null &&
        (_selectedPaymentOption == 'PIX' || _selectedCard != null);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: WaveAppbar(),
      body: Padding(
        padding: EdgeInsets.all(size.height * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.02),
                child: Text(
                  'Pagamento',
                  style: AppFonts.titleField(context),
                ),
              ),
              // Cartão de Crédito
              GestureDetector(
                onTap: () => _toggleSelection('Cartão de Crédito'),
                child: SizedBox(
                  height: size.height * 0.08, // Ajuste para o tamanho desejado
                  width: size.width * 0.9,
                  child: Container(
                    padding: EdgeInsets.all(size.height * 0.02),
                    decoration: BoxDecoration(
                      color: _selectedPaymentOption == 'Cartão de Crédito'
                          ? AppColors.greyShade100
                          : AppColors.white,
                      border: Border.all(
                        color: _selectedPaymentOption == 'Cartão de Crédito'
                            ? AppColors.grey
                            : AppColors.greyShade300,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cartão de Crédito',
                            style: AppFonts.textFont(context)),
                        Icon(Icons.credit_card),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              // Detalhes do Cartão de Crédito, visível apenas quando selecionado
              if (_selectedPaymentOption == 'Cartão de Crédito')
                Column(
                  children: [
                    // Cartões cadastrados
                    ..._cartoesCadastrados.map((cartao) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height *
                                0.01), // Aumente o espaçamento vertical entre os cartões
                        child: Container(
                          height: size.height *
                              0.08, // Ajuste para o tamanho desejado
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            color: _selectedCard == cartao
                                ? AppColors.greyShade100
                                : Colors.white,
                            border: Border.all(
                              color: _selectedCard == cartao
                                  ? AppColors.grey // Cor de seleção
                                  : AppColors.greyShade300,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            title:
                                Text(cartao, style: AppFonts.textFont(context)),
                            trailing:
                                Icon(Icons.credit_card, color: AppColors.black),
                            onTap: () {
                              setState(() {
                                _selectedCard =
                                    cartao; // Marcar o cartão selecionado
                              });
                            },
                          ),
                        ),
                      );
                    }).toList(),

                    // Novo cartão
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.height *
                              0.01), // Aumente o espaçamento vertical
                      child: GestureDetector(
                        onTap: () {
                          addCartao(context);
                        },
                        child: Container(
                          height: size.height *
                              0.08, // Ajuste para o tamanho desejado
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border: Border.all(
                              color: AppColors.greyShade300,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            title: Text('Adicionar Novo Cartão',
                                style: AppFonts.textFont(context)),
                            trailing: Icon(Icons.add_circle_outline,
                                color: AppColors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              // Cartão de Débito
              SizedBox(height: size.height * 0.01),
              GestureDetector(
                onTap: () => _toggleSelection('Cartão de Débito'),
                child: Container(
                  padding: EdgeInsets.all(size.height * 0.02),
                  decoration: BoxDecoration(
                    color: _selectedPaymentOption == 'Cartão de Débito'
                        ? AppColors.greyShade100
                        : Colors.white,
                    border: Border.all(
                      color: _selectedPaymentOption == 'Cartão de Débito'
                          ? AppColors.grey
                          : AppColors.greyShade300,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cartão de Débito',
                          style: AppFonts.textFont(context)),
                      Icon(Icons.credit_card),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              // Detalhes do Cartão de Débito, visível apenas quando selecionado
              if (_selectedPaymentOption == 'Cartão de Débito')
                Column(
                  children: [
                    // Cartões cadastrados
                    ..._cartoesCadastrados.map((cartao) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height *
                                0.01), // Aumente o espaçamento vertical entre os cartões
                        child: Container(
                          height: size.height *
                              0.08, // Ajuste para o tamanho desejado
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            color: _selectedCard == cartao
                                ? AppColors.greyShade100
                                : Colors.white,
                            border: Border.all(
                              color: _selectedCard == cartao
                                  ? AppColors.grey // Cor de seleção
                                  : AppColors.greyShade300,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            title:
                                Text(cartao, style: AppFonts.textFont(context)),
                            trailing:
                                Icon(Icons.credit_card, color: AppColors.black),
                            onTap: () {
                              setState(() {
                                _selectedCard =
                                    cartao; // Marcar o cartão selecionado
                              });
                            },
                          ),
                        ),
                      );
                    }).toList(),

                    // Novo cartão
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.height *
                              0.01), // Aumente o espaçamento vertical
                      child: GestureDetector(
                        onTap: () {
                          addCartao(context);
                        },
                        child: Container(
                          height: size.height *
                              0.08, // Ajuste para o tamanho desejado
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border: Border.all(
                              color: AppColors.greyShade300,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            title: Text('Adicionar Novo Cartão',
                                style: AppFonts.textFont(context)),
                            trailing: Icon(Icons.add_circle_outline,
                                color: AppColors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              SizedBox(height: size.height * 0.01),
              // PIX
              GestureDetector(
                onTap: () {
                  // Aqui é onde você marca o PIX como selecionado
                  setState(() {
                    _toggleSelection(
                        'PIX'); // Marca o PIX como a opção selecionada
                    _selectedCard = 'PIX'; // Marca o PIX no campo de cartão
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(size.height * 0.02),
                  decoration: BoxDecoration(
                    color: _selectedPaymentOption == 'PIX'
                        ? AppColors.greyShade300
                        : AppColors.white,
                    border: Border.all(
                      color: _selectedPaymentOption == 'PIX'
                          ? AppColors.grey
                          : AppColors.greyShade300,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('PIX', style: AppFonts.textFont(context)),
                      Icon(Icons.pix, color: AppColors.black),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PagamentoButton(
        onPressed: _isConfirmEnabled
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(  // Exemplo de página de confirmação
                      paymentOption: _selectedPaymentOption ?? 'Indefinido',
                    ),
                  ),
                );
              }
            : () {},
        title: 'Confirmar',
        isEnabled: _isConfirmEnabled,
      ),
    );
  }
}
