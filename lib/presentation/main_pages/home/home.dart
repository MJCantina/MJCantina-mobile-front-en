import 'package:cantina_senai/data/models/services/cart_controller.dart';
import 'package:cantina_senai/data/models/services/favorite_controller.dart';
import 'package:cantina_senai/presentation/pedidos/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cantina_senai/common/widgets/appbar/homebar.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";
  String selectedCategory = "";

  List<Map<String, dynamic>> categories = [
    {'name': 'Salgados', 'isSelected': false},
    {'name': 'Bebidas', 'isSelected': false},
    {'name': 'Lanches', 'isSelected': false},
    {'name': 'Pratos feitos', 'isSelected': false},
    {'name': 'Sobremesas', 'isSelected': false},
  ];

  final FavoritesController favoritesController =
      Get.find<FavoritesController>();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        searchQuery = searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
    double paddingbottom = size.width * 0.02;
    double categoryItemWidth = size.width * 0.3;

    return SafeArea(
      child: Scaffold(
        appBar: HomeBar(
          userName: AuthService.to.user?.displayName,
          searchController: searchController,
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(padding),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Cardápio', style: AppFonts.boldtitle(context)),
              ),
            ),
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
              padding:
                  EdgeInsets.symmetric(horizontal: padding, vertical: padding),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (!snapshot.hasData) {
                    return const Text('Nenhum produto encontrado.');
                  }

                  final products = snapshot.data!.docs.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    data['id'] = doc.id; 
                    return data;
                  }).where((product) {
                    // Filtragem por categoria e busca
                    final matchesSearch =
                        product['title'].toLowerCase().contains(searchQuery);
                    final matchesCategory = selectedCategory.isEmpty ||
                        product['category'].toLowerCase() == selectedCategory;
                    return matchesSearch && matchesCategory;
                  }).toList();

                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: paddingbottom),
                        child: SizedBox(
                          height: 130,
                          width: size.width,
                          child: GestureDetector(
                            onTap: () => Get.to(ItemPage(), arguments: product),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: size.width * 0.35,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      product['imageUrl'],
                                      fit: BoxFit.fill,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    (loadingProgress
                                                            .expectedTotalBytes ??
                                                        1)
                                                : null,
                                          ),
                                        );
                                      },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Center(
                                            child: Text(
                                                'Erro ao carregar imagem'));
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(width: size.width * 0.05),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(product['title'],
                                              style:
                                                  AppFonts.boldtitle(context)),
                                          FavoriteButton(
                                             productId: product['id'],
                                            onPressed: () {
                                              final productId =
                                                  product['id'];
                                              print(
                                                  'ID do produto: $productId');
                                              favoritesController
                                                  .toggleFavorite(productId);
                                            },
                                          ),
                                        ],
                                      ),
                                      Text(
                                        product['description'],
                                        style: AppFonts.placeHolder(context),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        softWrap: true,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('R\$${product['price']}',
                                              style:
                                                  AppFonts.titleField(context)),
                                          SizedBox(width: size.width * 0.035),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Get.find<CartController>()
                                                    .addToCart(product);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.primary,
                                                minimumSize:
                                                    Size(size.width * 0.02, 32),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        size.width * 0.04),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Text(
                                                'Add ao carrinho',
                                                style:
                                                    AppFonts.cartTxt(context),
                                              ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
