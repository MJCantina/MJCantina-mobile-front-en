import 'package:cantina_senai/common/widgets/appbar/simpleappbar.dart';
import 'package:flutter/material.dart';

class AnimatedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Animation<Offset> animation;

  const AnimatedAppBar({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: const Simpleappbar(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(135); // Altura da sua AppBar
}
