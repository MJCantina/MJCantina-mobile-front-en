import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final double? width;

  const CounterButton({
    required this.onPressed,
    required this.title,
    this.height,
    this.width,
    super.key,
  });

  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
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
    // Dimensões baseadas na largura e altura da tela
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth * 0.4, // 60% da largura da tela
      height: screenHeight * 0.070, // 8% da altura da tela
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Ícone de remover
            IconButton(
              onPressed: _diminuirItem,
              icon: Icon(Icons.remove_circle),
              color: AppColors.primary,
              iconSize: screenWidth * 0.08, // Proporcional à largura da tela
            ),

            // Texto centralizado
            Expanded(
              child: Center(
                child: Text(
                  '$_contador',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045, // Proporcional à largura
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Ícone de adicionar
            IconButton(
              onPressed: _adicionarItem,
              icon: Icon(Icons.add_circle),
              color: AppColors.primary,
              iconSize: screenWidth * 0.08,
            ),
          ],
        ),
      ),
    );
  }
}
class CounterButtonCart extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final double? width;

  const CounterButtonCart({
    required this.onPressed,
    required this.title,
    this.height,
    this.width,
    super.key,
  });

  @override
  _CounterButtonCartState createState() => _CounterButtonCartState();
}

class _CounterButtonCartState extends State<CounterButtonCart> {
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
    // Dimensões baseadas na largura e altura da tela
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: widget.width ?? screenWidth * 0.25, // Largura responsiva
      height: widget.height ?? screenHeight * 0.06, // Altura responsiva
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // Controle do espaçamento interno
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alinha os itens uniformemente
          children: [
            // Ícone de remover
            GestureDetector(
              onTap: _diminuirItem,
              child: Icon(
                Icons.remove_circle,
                color: AppColors.primary,
                size: screenWidth * 0.06, // Tamanho proporcional
              ),
            ),

            // Contador centralizado
            Text(
              '$_contador',
              style: TextStyle(
                fontSize: screenWidth * 0.04, // Tamanho proporcional
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Ícone de adicionar
            GestureDetector(
              onTap: _adicionarItem,
              child: Icon(
                Icons.add_circle,
                color: AppColors.primary,
                size: screenWidth * 0.06,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class CounterButtonItem extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final double? width;

  const CounterButtonItem({
    required this.onPressed,
    required this.title,
    this.height,
    this.width,
    super.key,
  });

  @override
  _CounterButtonItemState createState() => _CounterButtonItemState();
}

class _CounterButtonItemState extends State<CounterButtonItem> {
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
    // Dimensões baseadas na largura e altura da tela
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth * 0.45, // 60% da largura da tela
      height: screenHeight * 0.1, // 8% da altura da tela
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Ícone de remover
            IconButton(
              onPressed: _diminuirItem,
              icon: Icon(Icons.remove_circle),
              color: AppColors.primary,
              iconSize: screenWidth * 0.08, // Proporcional à largura da tela
            ),

            // Texto centralizado
            Expanded(
              child: Center(
                child: Text(
                  '$_contador',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045, // Proporcional à largura
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Ícone de adicionar
            IconButton(
              onPressed: _adicionarItem,
              icon: Icon(Icons.add_circle),
              color: AppColors.primary,
              iconSize: screenWidth * 0.08,
            ),
          ],
        ),
      ),
    );
  }
}