import 'package:flutter/material.dart';
import 'package:hotel_app/utils/consts/paymentConsts/colors_consts.dart';
import 'package:hotel_app/utils/consts/paymentConsts/string_consts.dart';
import 'package:hotel_app/utils/consts/paymentConsts/textstyle_consts.dart';

class BottomButtonWidget extends StatelessWidget {
  const BottomButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: TextButton(
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            fixedSize: Size(size.width, 50),
            padding: const EdgeInsets.symmetric(vertical: 15),
            backgroundColor: PaymentColors.buttonBgColor),
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/hotel',  ModalRoute.withName('/'));
        },
        child: const Text(
          PaymentStringConsts.buttonTitle,
          style: PaymentTextStyles.buttonTitleTextStyle,
        ),
      ),
    );
  }
}
