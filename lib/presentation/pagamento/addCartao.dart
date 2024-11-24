import 'package:flutter/material.dart';

class CadastroCartaoPage extends StatelessWidget {
  const CadastroCartaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Novo Cartão')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campos para cadastro do cartão
            TextField(
              decoration: InputDecoration(labelText: 'Número do Cartão'),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Nome no Cartão'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para salvar o cartão
                Navigator.pop(context); // Volta para a página de pagamento
              },
              child: Text('Adicionar Cartão'),
            ),
          ],
        ),
      ),
    );
  }
}
