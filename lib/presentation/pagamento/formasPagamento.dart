import 'package:cantina_senai/common/widgets/appbar/waveappbar.dart';
import 'package:cantina_senai/common/widgets/base_button/appbutton.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/presentation/pagamento/addCartao.dart';
import 'package:flutter/material.dart';
class PagamentoPage extends StatefulWidget {
  const PagamentoPage({super.key});

  @override
  State<PagamentoPage> createState() => _PagamentoPageState();
}

class _PagamentoPageState extends State<PagamentoPage> {
  String? _selectedPaymentOption; // Estado para a opção selecionada
  final List<String> _cartoesCadastrados = ['092.***.***', '093.***.913']; // Lista de cartões

  void _adicionarCartao() {
    // Função para adicionar um novo cartão
    print("Adicionar novo cartão chamado");
  }

  // Função para alternar a visibilidade do conteúdo ao clicar
  void _toggleSelection(String paymentOption) {
    setState(() {
      if (_selectedPaymentOption == paymentOption) {
        _selectedPaymentOption = null; // Desmarcar se já estiver selecionado
      } else {
        _selectedPaymentOption = paymentOption; // Marcar a opção selecionada
      }
    });
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
                child: Container(
                  padding: EdgeInsets.all(size.height * 0.02),
                  decoration: BoxDecoration(
                    color: _selectedPaymentOption == 'Cartão de Crédito'
                        ? Colors.grey.shade100
                        : Colors.white,
                    border: Border.all(
                      color: _selectedPaymentOption == 'Cartão de Crédito'
                          ? Colors.grey
                          : Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cartão de Crédito', style: AppFonts.textFont(context)),
                      Icon(Icons.credit_card),
                    ],
                  ),
                ),
              ),
              // Detalhes do Cartão de Crédito, visível apenas quando selecionado
              if (_selectedPaymentOption == 'Cartão de Crédito')
                Column(
                  children: [
                    ..._cartoesCadastrados.map((cartao) {
                      return Padding(
                        padding: EdgeInsets.all(size.height * 0.01),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedPaymentOption == 'Cartão de Crédito'
                                ? Colors.grey.shade100
                                : Colors.white,
                            border: Border.all(
                              color:
                                  _selectedPaymentOption == 'Cartão de Crédito'
                                      ? Colors.grey
                                      : Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            title:
                                Text(cartao, style: AppFonts.textFont(context)),
                            trailing:
                                Icon(Icons.credit_card, color: Colors.black),
                          ),
                        ),
                      );
                    }).toList(),

                    // Novo cartão
                    Padding(
                      padding: EdgeInsets.all(size.height * 0.01),
                      child: GestureDetector(
                        onTap: () {
                          // Navega para a página de cadastro de cartão
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CadastroCartaoPage()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            title: Text('Adicionar Novo Cartão',
                                style: AppFonts.textFont(context)),
                            trailing: Icon(Icons.add_circle_outline,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              // Cartão de Débito
              SizedBox(height: size.height * 0.02),
              GestureDetector(
                onTap: () => _toggleSelection('Cartão de Débito'),
                child: Container(
                  padding: EdgeInsets.all(size.height * 0.02),
                  decoration: BoxDecoration(
                    color: _selectedPaymentOption == 'Cartão de Débito'
                        ? Colors.grey.shade100
                        : Colors.white,
                    border: Border.all(
                      color: _selectedPaymentOption == 'Cartão de Débito'
                          ? Colors.grey
                          : Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cartão de Débito', style: AppFonts.textFont(context)),
                      Icon(Icons.credit_card),
                    ],
                  ),
                ),
              ),
              // Detalhes do Cartão de Débito, visível apenas quando selecionado
              if (_selectedPaymentOption == 'Cartão de Débito')
                Column(
                  children: [
                    ..._cartoesCadastrados.map((cartao) {
                      return Padding(
                        padding: EdgeInsets.all(size.height * 0.01),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedPaymentOption == 'Cartão de Débito'
                                ? Colors.grey.shade100
                                : Colors.white,
                            border: Border.all(
                              color:
                                  _selectedPaymentOption == 'Cartão de Débito'
                                      ? Colors.grey
                                      : Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            title:
                                Text(cartao, style: AppFonts.textFont(context)),
                            trailing:
                                Icon(Icons.credit_card, color: Colors.black),
                          ),
                        ),
                      );
                    }).toList(),

                    // Novo cartão
                    Padding(
                      padding: EdgeInsets.all(size.height * 0.01),
                      child: GestureDetector(
                        onTap: () {
                          // Navega para a página de cadastro de cartão
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CadastroCartaoPage()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            title: Text('Adicionar Novo Cartão',
                                style: AppFonts.textFont(context)),
                            trailing: Icon(Icons.add_circle_outline,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: size.height * 0.02),
              // PIX
              GestureDetector(
                onTap: () => _toggleSelection('PIX'),
                child: Container(
                  padding: EdgeInsets.all(size.height * 0.02),
                  decoration: BoxDecoration(
                    color: _selectedPaymentOption == 'PIX'
                        ? Colors.grey.shade300
                        : Colors.white,
                    border: Border.all(
                      color: _selectedPaymentOption == 'PIX'
                          ? Colors.grey
                          : Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'PIX',
                        style: AppFonts.textFont(context)
                      ),
                      Icon(Icons.pix, color: Colors.black),
                      SizedBox(width: size.width * 0.03),
                    ],
                  ),
                ),
              ),
              // Detalhes do PIX, visível apenas quando selecionado
              if (_selectedPaymentOption == 'PIX')
                Center(child: Padding(
                  padding: EdgeInsets.all(size.height * 0.02),
                  child: Text('Use o QR Code ou copie o código do PIX.'),
                )),
              
            ],
          ),

        ),
      ),
      bottomNavigationBar: BasicAppButton(onPressed: (){}, title: 'Confirmar'),
    );
  }
}
