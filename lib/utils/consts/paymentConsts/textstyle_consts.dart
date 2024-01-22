import 'package:flutter/material.dart';
import 'package:hotel_app/utils/consts/paymentConsts/colors_consts.dart';

abstract class PaymentTextStyles {
  static const appBarTextStyle = TextStyle(
    color: PaymentColors.appBarColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFProDisplay',
  );
  static const titleAboutPaymentTextStyle = TextStyle(
    color: PaymentColors.titleAboutPaymentColor,
    fontSize: 22,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFProDisplay',
  );
  static const descriptionAboutPaymentTextStyle = TextStyle(
    color: PaymentColors.descriptionAboutPaymentColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'SFProDisplay',
  );
  static const buttonTitleTextStyle = TextStyle(
    color: PaymentColors.buttonTitleColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFProDisplay',
  );
}
