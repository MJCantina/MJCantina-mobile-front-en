import 'package:cantina_senai/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

class Polices extends StatefulWidget {
  const Polices({super.key});

  @override
  State<Polices> createState() => _PolicesState();
}

class _PolicesState extends State<Polices> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
