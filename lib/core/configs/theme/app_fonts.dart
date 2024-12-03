
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static double _getFontSize(BuildContext context, double percentage) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * percentage;
  }

  static TextStyle titleFont(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.085),  // 8.5% da largura da tela
      color: AppColors.black,
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle titlePrice(BuildContext context) {
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
static TextStyle labelBlackBold(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: _getFontSize(context, 0.03),  // 3% da largura da tela
      color: AppColors.black,
      fontWeight: FontWeight.w900,
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