import 'dart:async';

import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

// FavoritesController
class FavoritesController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<String> favoriteProducts = <String>[].obs; // IDs dos produtos favoritos
  final RxBool isLoading = false.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    fetchFavorites();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  Future<void> fetchFavorites() async {
    isLoading.value = true;

    final user = Get.find<AuthService>().user;
    if (user == null) {
      return;
    }

    try {
      final doc = await _firestore.collection('favorites').doc(user.uid).get();
      if (doc.exists) {
        favoriteProducts.assignAll(List<String>.from(doc['products'] ?? []));
      }
    } catch (e) {
      if (!Get.isSnackbarOpen) {
        Future.delayed(Duration.zero, () {
          Get.snackbar(
            'Erro ao buscar favoritos',
            e.toString(),
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        });
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> toggleFavorite(String productId) async {
    final user = Get.find<AuthService>().user;
    if (user == null) {
      Get.snackbar(
        'Erro',
        'Usuário não está logado. Faça login para adicionar aos favoritos.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      if (favoriteProducts.contains(productId)) {
        favoriteProducts.remove(productId); // Remove o produto da lista de favoritos
      } else {
        favoriteProducts.add(productId); // Adiciona o produto à lista de favoritos
      }

      await _firestore.collection('favorites').doc(user.uid).set({
        'products': favoriteProducts,
      });

      Get.snackbar(
        'Favoritos',
        favoriteProducts.contains(productId)
            ? 'Produto adicionado aos favoritos'
            : 'Produto removido dos favoritos',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Erro',
        'Não foi possível atualizar os favoritos.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  bool isFavorited(String productId) {
    return favoriteProducts.contains(productId);
  }
}

// FavoriteButton
class FavoriteButton extends StatelessWidget {
  final String productId; // ID do produto para determinar se é favoritado
  final FavoritesController favoritesController = Get.find<FavoritesController>();

  FavoriteButton({required this.productId, required VoidCallback onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        // Verifica se o produto está favoritado no Firestore
        bool isFavorited = favoritesController.isFavorited(productId);

        return IconButton(
          onPressed: () {
            favoritesController.toggleFavorite(productId); // Alterna o estado favorito
          },
          icon: Icon(
            isFavorited ? Icons.favorite : Icons.favorite_border,
            color: isFavorited ? AppColors.primary : Colors.grey,
          ),
        );
      },
    );
  }
}
