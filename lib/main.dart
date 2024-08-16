import 'package:cantina_senai/common/widgets/appbar/appbarhome.dart';
import 'package:cantina_senai/common/widgets/appbar/basicappbar.dart';
import 'package:cantina_senai/common/widgets/appbar/waveappbar.dart';
import 'package:cantina_senai/common/widgets/bottom_bar/bottombar.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       appBar: WaveAppbar(),
       bottomNavigationBar: Bottombar(),
    ));
  }
}