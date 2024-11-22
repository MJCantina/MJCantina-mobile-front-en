import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final VoidCallback onPressed;
  final double? height;

  const FavoriteButton({
    required this.onPressed,
    this.height,
    super.key,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _favoritar = false;

  void _alternarEstadoCurtida() {
    setState(() {
  _favoritar = !_favoritar;
});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: _alternarEstadoCurtida,
        icon: Icon(_favoritar ? Icons.favorite : Icons.favorite_border,
            color: _favoritar ? AppColors.primary : Colors.grey));
  }
}
