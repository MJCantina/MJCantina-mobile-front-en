import 'package:get/get.dart';

class CartController extends GetxController {
  // Lista de produtos no carrinho
  var cartItems = <Map<String, dynamic>>[].obs;

  // Adicionar produto ao carrinho
  void addToCart(Map<String, dynamic> product) {
 // Verifica se o produto não é null
    cartItems.add(product);
    }

  // Remover produto do carrinho
  void removeFromCart(Map<String, dynamic> product) {
 // Verifica se o produto não é null
    cartItems.remove(product);
    }

  // Limpar o carrinho
  void clearCart() {
    cartItems.clear();
  }

  // Total do carrinho (soma dos preços)
  double get total {
    double sum = 0;
    for (var item in cartItems) {
      // Verifica se o 'price' existe e pode ser convertido para double
      sum += double.tryParse(item['price'].toString()) ?? 0.0;
    }
    return sum;
  }

}
