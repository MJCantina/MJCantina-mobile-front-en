import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CounterButtonMin extends StatefulWidget {
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final String title; // Título para personalização do botão

  const CounterButtonMin({
    required this.onPressed,
    required this.title, // Título obrigatório
    this.height,
    this.width,
    super.key,
  });

  @override
  _CounterButtonMinState createState() => _CounterButtonMinState();
}

class _CounterButtonMinState extends State<CounterButtonMin> {
  int _contador = 1;

  void _adicionarItem() {
    setState(() {
      _contador++;
    });
  }

  void _diminuirItem() {
    setState(() {
      if (_contador > 1) {
        _contador--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: widget.width ?? screenWidth * 0.3, // Ajuste de largura
      height: widget.height ?? screenHeight * 0.06, // Ajuste de altura
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _diminuirItem,
              child: Icon(
                Icons.remove_circle,
                color: AppColors.primary,
                size: screenWidth * 0.05,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Text(
                '$_contador',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: _adicionarItem,
              child: Icon(
                Icons.add_circle,
                color: AppColors.primary,
                size: screenWidth * 0.05,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
