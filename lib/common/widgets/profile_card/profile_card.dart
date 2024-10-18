import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class ConfigChange extends StatefulWidget {

  final String title;
  final String config;

  const ConfigChange({
    required this.title,
    required this.config,
    super.key
    });

  @override
  State<ConfigChange> createState() => _ConfigChangeState();
}

class _ConfigChangeState extends State<ConfigChange> {

  
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Container(
                  width: size.width * 0.90,
                  height: size.height * 0.10,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: const Color(0xFFEEEEEE)),
                    borderRadius: BorderRadius.circular(24)
                    
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(widget.title, style: AppFonts.titleField,),
                            Text(widget.config, style: AppFonts.subtitle,)
                          ],
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_rounded))
                    ],
                  ),
                ),
      ),
    );
  }
}