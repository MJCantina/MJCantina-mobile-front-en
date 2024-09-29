import 'package:cantina_senai/common/widgets/appbar/waveappbar.dart';
import 'package:cantina_senai/common/widgets/bottom_bar/bottombar.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WaveAppbar(),
      body: Padding(padding: EdgeInsets.all(16)),
    );
  }
}