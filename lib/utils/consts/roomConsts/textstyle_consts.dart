import 'package:hotel_app/utils/consts/roomConsts/colors_consts.dart';
import 'package:flutter/material.dart';

abstract class RoomTextStyles {
  static const appBarTextStyle = TextStyle(
    color: RoomColors.appBarColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFProDisplay',
  );
  static const titleTextStyle = TextStyle(
    color: RoomColors.titleColor,
    fontSize: 22,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFProDisplay',
  );
  static const priceTextStyle = TextStyle(
    color: RoomColors.priceColor,
    fontSize: 30,
    fontWeight: FontWeight.w600,
    fontFamily: 'SFProDisplay',
  );
  static const priceForItTextStyle = TextStyle(
    color: RoomColors.priceForItColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'SFProDisplay',
  );
  static const peculiaritiesTextStyle = TextStyle(
    color: RoomColors.peculiaritiesColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFProDisplay',
  );
  static const buttonTitleTextStyle = TextStyle(
    color: RoomColors.selectButtonTitleColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFProDisplay',
  );
  static const moreButtonTitleTextStyle = TextStyle(
    color: RoomColors.moreButtonColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFProDisplay',
  );
}
