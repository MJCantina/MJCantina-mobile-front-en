import 'package:cantina_senai/common/widgets/appbar/homebar.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       appBar: HomeBar(),
       bottomNavigationBar: Bottombar(),
    ));
  }
}