import 'package:get/get.dart';

class CartController extends GetxController {

  var cartItems = <Map<String, dynamic>>[].obs;

  void addToCart(Map<String, dynamic> product) {
    cartItems.add(product);
    }

  void removeFromCart(Map<String, dynamic> product) {
    cartItems.remove(product);
    }

  // Limpar o carrinho
  void clearCart() {
    cartItems.clear();
  }

  double get total {
    double sum = 0;
    for (var item in cartItems) {
      sum += double.tryParse(item['price'].toString()) ?? 0.0;
    }
    return sum;
  }

}
