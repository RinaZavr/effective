import 'package:effective/consts/colors_consts.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const ratingTextStyle = TextStyle(
    color: AppColors.ratingContentColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFProDisplay',
  );
  static const appBarTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFProDisplay',
  );
}
