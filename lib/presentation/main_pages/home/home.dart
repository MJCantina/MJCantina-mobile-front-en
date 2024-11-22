import 'package:cantina_senai/data/models/services/cart_controller.dart';
import 'package:cantina_senai/presentation/main_pages/perfil/perfil.dart';
import 'package:cantina_senai/presentation/pedidos/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cantina_senai/common/widgets/appbar/homebar.dart';
import 'package:cantina_senai/common/widgets/base_button/favorite_button.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_images.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(padding),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Últimos pedidos',
                  style:
                      AppFonts.boldtitle(context)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Cardápio',
                  style:
                      AppFonts.boldtitle(context)
                ),
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
                  final products = snapshot.data!.docs
                      .map((doc) => doc.data() as Map<String, dynamic>)
                      .toList();

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
                            onTap: () => {
                              Get.to(ItemPage(), arguments: product)
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: size.width * 0.35,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        product['imageUrl'],
                                        fit: BoxFit.fill,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          } else {
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
                                          }
                                        },
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              debugPrint('Erro ao carregar imagem da URL: ${product['imageUrl']}');
                                          return const Center(
                                              child: Text(
                                                  'Erro ao carregar imagem'));
                                        },
                                      )),
                                ),
                                SizedBox(width: size.width * 0.05),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            product[
                                                'title'], 
                                            style: AppFonts.boldtitle(context)
                                          ),
                                          FavoriteButton(
                                            onPressed: () {
                                              
                                            },
                                          ),
                                        ],
                                      ),
                                      Text(
                                        product[
                                            'description'], 
                                        style: AppFonts.placeHolder(context),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        softWrap: true,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'R\$${product['price']}', 
                                            style: AppFonts.titleField(context)
                                          ),
                                          SizedBox(width: size.width * 0.035),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(bottom: 8),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Get.find<CartController>().addToCart(product);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                overlayColor: AppColors.grey,
                                                backgroundColor:
                                                    AppColors.primary,
                                                minimumSize:
                                                    Size(size.width * 0.03, 35),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Text(
                                                'Add ao carrinho',
                                                style: AppFonts.cartTxt(context),
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
