
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static final titleFont = GoogleFonts.poppins(
      fontSize: 32, color: AppColors.black, fontWeight: FontWeight.w700);
  static final boldtitle = GoogleFonts.poppins(
      fontSize: 20, color: AppColors.black, fontWeight: FontWeight.w700); 
  static final subtitle = GoogleFonts.poppins(
      fontSize: 16, color: AppColors.grey, fontWeight: FontWeight.w400);
  static final titleField = GoogleFonts.poppins(
      fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600);
  static final textFont = GoogleFonts.poppins(
      fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w400);
  static final buttonText = GoogleFonts.poppins(
      fontSize: 16, color: AppColors.white, fontWeight: FontWeight.bold);
  static final payText = GoogleFonts.poppins(
      fontSize: 16, color: AppColors.primary, fontWeight: FontWeight.bold);
  static final profileDesc = GoogleFonts.poppins(
      fontSize: 16, color: AppColors.grey, fontWeight: FontWeight.bold);
  static final removeText = GoogleFonts.poppins(
      fontSize: 12, color: AppColors.white, fontWeight: FontWeight.w800);
  static final category = GoogleFonts.poppins(
      fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w600);
  static final plateDesc = GoogleFonts.poppins(
      fontSize: 12, color: AppColors.black, fontWeight: FontWeight.w800);
  static final textDesc = GoogleFonts.poppins(
      fontSize: 12, color: AppColors.grey, fontWeight: FontWeight.w400);
  static final labelBlack = GoogleFonts.poppins(
      fontSize: 12, color: AppColors.black, fontWeight: FontWeight.w600);
  static final labelRed = GoogleFonts.poppins(
      fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w600);
  static final labelWhite = GoogleFonts.poppins(
      fontSize: 12, color: AppColors.white, fontWeight: FontWeight.w600);
  static final placeHolder = GoogleFonts.poppins(
      fontSize: 14, color: AppColors.grey, fontWeight: FontWeight.w500);
  static final textHolder = GoogleFonts.poppins(
      fontSize: 14, color: AppColors.black, fontWeight: FontWeight.w500);

  static double _getFontSize(BuildContext context, double percentage) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * percentage;
  }

  static TextStyle titleFont(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.07),  // 8.5% da largura da tela
      color: AppColors.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle boldtitle(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.04),  // 4% da largura da tela
      color: AppColors.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle subtitle(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.04),  // 4% da largura da tela
      color: AppColors.grey,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle titleField(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.05),  // 4% da largura da tela
      color: AppColors.black,
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle titleFieldUnderLine(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.05),  // 4% da largura da tela
      color: AppColors.black,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline,
    );
  }
  static TextStyle textFont(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.04),  // 4% da largura da tela
      color: AppColors.black,
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle textFontMin(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.03),  // 3% da largura da tela
      color: AppColors.black,
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle buttonTextMin(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.025),  // 4.5% da largura da tela
      color: AppColors.white,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle buttonText(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.045),  // 4.5% da largura da tela
      color: AppColors.white,
      fontWeight: FontWeight.bold,
    );
  }
  

  static TextStyle payText(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.045),  // 4.5% da largura da tela
      color: AppColors.primary,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle profileDesc(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.04),  // 4% da largura da tela
      color: AppColors.grey,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle removeText(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.03),  // 3% da largura da tela
      color: AppColors.white,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle category(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.03),  // 3% da largura da tela
      color: AppColors.primary,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle categorySelected(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.03),  // 3% da largura da tela
      color: AppColors.white,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle plateDesc(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.03),  // 3% da largura da tela
      color: AppColors.black,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle textDesc(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.03),  // 3% da largura da tela
      color: AppColors.grey,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle labelBlack(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.03),  // 3% da largura da tela
      color: AppColors.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle labelRed(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.03),  // 3% da largura da tela
      color: AppColors.primary,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle placeHolder(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.035),  // 3.5% da largura da tela
      color: AppColors.grey,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textHolder(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.035),  // 3.5% da largura da tela
      color: AppColors.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textHolderUnderLine(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.035),  // 3.5% da largura da tela
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.underline,
    );
  }

  static TextStyle cartTxt(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.02),  // 2% da largura da tela
      color: AppColors.white,
      fontWeight: FontWeight.w600,
    );
  }
}