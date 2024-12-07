import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final String _baseUrl = 'https://us-central1-aprendendo-a-criar-api-bec54.cloudfunctions.net/api';

  var paymentResult = {}.obs;
  var errorMessage = ''.obs;

  Future<void> generatePix({
    required String transactionAmount,
    required String description,
    required String email,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/api/generate-pix'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'transactionAmount': transactionAmount,
          'description': description,
          'email': email,
        }),
      );

      if (response.statusCode == 200) {
        paymentResult.value = json.decode(response.body);
      } else {
        errorMessage.value = 'Erro ao gerar PIX';
        throw Exception('Erro ao gerar PIX');
      }
    } catch (e) {
      errorMessage.value = 'Erro de rede: $e';
      throw Exception('Erro de rede: $e');
    }
  }

   Future<String> generateCardToken({
    required String cardNumber,
    required String cardholderName,
    required String expirationMonth,
    required String expirationYear,
    required String securityCode,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.mercadopago.com/v1/card_tokens'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer TEST-1854496655479950-120221-7fd80067f595a6e8d796f973a8abaa91-258035525', 
        },
        body: json.encode({
          'card_number': cardNumber,
          'cardholder_name': cardholderName,
          'expiration_month': expirationMonth,
          'expiration_year': expirationYear,
          'security_code': securityCode,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['id']; 
      } else {
        errorMessage.value = 'Erro ao gerar token de cartão';
        throw Exception('Erro ao gerar token de cartão');
      }
    } catch (e) {
      errorMessage.value = 'Erro de rede: $e';
      throw Exception('Erro de rede: $e');
    }
  }

  Future<void> processPayment({
    required String customerId,
    required String transactionAmount,
    required String description,
    required String paymentMethodId,
    required int installments,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/process-payment'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'customerId': customerId,
          'transactionAmount': transactionAmount,
          'description': description,
          'paymentMethodId': paymentMethodId,
          'installments': installments,
        }),
      );

      if (response.statusCode == 200) {
        paymentResult.value = json.decode(response.body);
      } else {
        errorMessage.value = 'Erro ao processar pagamento';
        throw Exception('Erro ao processar pagamento');
      }
    } catch (e) {
      errorMessage.value = 'Erro de rede: $e';
      throw Exception('Erro de rede: $e');
    }
  }

  Future<void> addCard({
    required String email,
    required String cardToken,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/api/add-card'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'cardToken': cardToken,
        }),
      );

      if (response.statusCode == 200) {
        paymentResult.value = json.decode(response.body);
      } else {
        errorMessage.value = 'Erro ao adicionar cartão';
        throw Exception('Erro ao adicionar cartão');
      }
    } catch (e) {
      errorMessage.value = 'Erro de rede: $e';
      throw Exception('Erro de rede: $e');
    }
  }
}
