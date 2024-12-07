import 'package:cantina_senai/common/widgets/appbar/appbararrow.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:cantina_senai/data/models/services/favorite_controller.dart';
import 'package:cantina_senai/presentation/pedidos/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavoritesController favoritesController =
      Get.find<FavoritesController>();
  List<Map<String, dynamic>> favoriteProducts = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  // Carregar os favoritos
  Future<void> _loadFavorites() async {
    try {
      String? userId = AuthService.to.getCurrentUserId();

      if (userId == null) {
        setState(() {
          favoriteProducts = [];
        });
        return;
      }


      final favoriteDoc = await FirebaseFirestore.instance
          .collection('favorites')
          .doc(userId)
          .get();

      if (!favoriteDoc.exists || favoriteDoc.data() == null) {
        setState(() {
          favoriteProducts = [];
        });
        return;
      }

      List<String> favoriteProductIds = List<String>.from(favoriteDoc['products'] ?? []);
      if (favoriteProductIds.isEmpty) {
        setState(() {
          favoriteProducts = [];
        });
        
      }

      final productSnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where(FieldPath.documentId, whereIn: favoriteProductIds)
          .get();
          

      List<Map<String, dynamic>> products = productSnapshot.docs
          .map((doc) => doc.data())
          .toList();

      setState(() {
        favoriteProducts = products;
      });
    } catch (e) {
      print("Erro ao carregar favoritos: $e");
      setState(() {
        favoriteProducts = [];

      });
    }

  }

  

  String selectedCategory = "";

  List<Map<String, dynamic>> categories = [
    {'name': 'Salgados', 'isSelected': false},
    {'name': 'Bebidas', 'isSelected': false},
    {'name': 'Lanches', 'isSelected': false},
    {'name': 'Pratos feitos', 'isSelected': false},
    {'name': 'Sobremesas', 'isSelected': false},
  ];

  void _selectCategory(int index) {
    setState(() {
      for (var i = 0; i < categories.length; i++) {
        categories[i]['isSelected'] = i == index;
      }
      selectedCategory = categories[index]['name'].toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double padding = size.width * 0.04;
    double categoryItemWidth = size.width * 0.3;
    double paddingBottom = size.width * 0.02;

    return Scaffold(
      appBar: AppBarArrow(namePage: 'Favoritos'),
      body: ListView(
        children: [
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: index == categories.length - 1 ? padding : 10.0,
                    left: index == 0 ? padding : 0,
                  ),
                  child: GestureDetector(
                    onTap: () => _selectCategory(index),
                    child: Container(
                      width: categoryItemWidth,
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      decoration: BoxDecoration(
                        color: categories[index]['isSelected']
                            ? AppColors.primary
                            : const Color(0xFFFFEDED),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          categories[index]['name'],
                          style: categories[index]['isSelected']
                              ? AppFonts.categorySelected(context)
                              : AppFonts.category(context),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
            child: Obx(() {
              if (favoritesController.favoriteProducts.isEmpty) {
                return const Center(child: Text('Nenhum produto favorito'));
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: favoritesController.favoriteProducts.length,
                  itemBuilder: (context, index) {
                    final productId = favoritesController.favoriteProducts[index];

                    return FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance.collection('products').doc(productId).get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData || !snapshot.data!.exists) {
                          return const Center(child: Text('Produto não encontrado'));
                        }

                        final productData = snapshot.data!.data() as Map<String, dynamic>;
                        productData['id'] = snapshot.data!.id; 

                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: paddingBottom),
                          child: SizedBox(
                            height: 130,
                            width: size.width,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(ItemPage(), arguments: productData);
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.35,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        productData['imageUrl'] ?? 'https://example.com/default-image.png',
                                        fit: BoxFit.fill,
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) return child;
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress.expectedTotalBytes != null
                                                  ? loadingProgress.cumulativeBytesLoaded /
                                                      (loadingProgress.expectedTotalBytes ?? 1)
                                                  : null,
                                            ),
                                          );
                                        },
                                        errorBuilder: (context, error, stackTrace) {
                                          return const Center(child: Text('Erro ao carregar imagem'));
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: size.width * 0.05),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(productData['title'] ?? 'Sem título', style: AppFonts.boldtitle(context)),
                                            FavoriteButton(
                                              productId: productData['id'], // ID do produto
                                              onPressed: () {
                                                favoritesController.toggleFavorite(productData['id']);
                                              },
                                            ),
                                          ],
                                        ),
                                        Text(
                                          productData['description'] ?? 'Sem descrição',
                                          style: AppFonts.placeHolder(context),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('R\$${productData['price']?.toString() ?? '0.00'}', style: AppFonts.titleField(context)),
                                            SizedBox(width: size.width * 0.035),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 8),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  // Adicione ao carrinho ou faça outra ação
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: AppColors.primary,
                                                  minimumSize: Size(size.width * 0.02, 32),
                                                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                                ),
                                                child: Text('Add ao carrinho', style: AppFonts.cartTxt(context)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
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
            }),
          ),
        ],
      ),
    );
  }
}
