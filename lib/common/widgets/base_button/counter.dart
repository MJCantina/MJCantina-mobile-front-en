import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;

  const CounterButton({
    required this.onPressed,
    required this.title,
    this.height,
    super.key,
  });

  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int _contador = 0; 

  void _adicionarItem() {
    setState(() {
      _contador++;
    });
  }

  void _diminuirItem() {
    setState(() {
      if (_contador > 0) {
        _contador--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _diminuirItem,
              icon: Icon(Icons.remove),
              color: AppColors.primary,
              iconSize: 30,
            ),
            SizedBox(width: 10),
            Text(
              '$_contador',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            IconButton(
              onPressed: _adicionarItem,
              icon: Icon(Icons.add),
              color: AppColors.primary,
              iconSize: 30,
            ),
          ],
        ),
      ),
    );
  }
}