import 'package:cantina_senai/common/widgets/appbar/appbararrow.dart';
import 'package:cantina_senai/common/widgets/module/moduleborder.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/core/configs/theme/app_fonts.dart';
import 'package:cantina_senai/core/configs/theme/app_vectors.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetalhePedido extends StatefulWidget {
  const DetalhePedido({super.key});

  @override
  State<DetalhePedido> createState() => _DetalhePedidoState();
}

class _DetalhePedidoState extends State<DetalhePedido> {
  var user = AuthService.to.user?.displayName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarArrow(namePage: 'Detalhe do pedido'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Wrap(
                runSpacing: 28,
                children: [
                  Wrap(
                    runSpacing: 20,
                    children: [
                      moduleBorder(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Em andamento', style: AppFonts.textFont,),
                            Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: AppColors.primary,
                                  width: 4,
                                  style: BorderStyle.solid
                                )
                              ),
                            )
                          ],
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              user!,
                              style: AppFonts.titleField,
                            ),
                            Wrap(
                              spacing: 12,
                              children: [
                                Text(
                                  '16/10/2024',
                                  style: AppFonts.textDesc,
                                ),
                                Text(
                                  '11:16',
                                  style: AppFonts.textDesc,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      moduleBorder(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              spacing: 12,
                              children: [
                                SvgPicture.asset(AppVectors.reserve),
                                Text('No balcão', style: AppFonts.textFont)
                              ],
                            ),
                            Text('#7556', style: AppFonts.boldtitle,)
                          ],
                        )
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Wrap(
                      runSpacing: 12,
                      children: [
                        Text(
                          'Produtos',
                          style: AppFonts.titleField,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              spacing: 12,
                              children: [
                                Text(
                                  '1x',
                                  style: AppFonts.textFont,
                                ),
                                Text(
                                  'Coxinha',
                                  style: AppFonts.textFont,
                                )
                              ],
                            ),
                            Text(
                              'R\$3,80',
                              style: AppFonts.textFont,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  moduleBorder(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total', style: AppFonts.boldtitle),
                        Text('R\$3,80', style: AppFonts.boldtitle)
                      ],
                    )
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Qualque dúvida pergunte à Cantina',
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}