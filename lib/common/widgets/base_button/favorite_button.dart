import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final String productId;

  const FavoriteButton({Key? key, required this.productId}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  // Variável para armazenar o estado atual (favoritado ou não)
  bool isFavorited = false;

  // Função para alternar o estado
  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });

    // Aqui você pode enviar o estado para o backend
    print('${widget.productId} favoritado: $isFavorited');
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorited ? Icons.favorite : Icons.favorite_border,
        color: isFavorited ? Colors.red : Colors.grey,
      ),
      onPressed: toggleFavorite,
    );
  }
}
