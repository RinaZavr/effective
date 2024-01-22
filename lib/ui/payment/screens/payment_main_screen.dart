import 'package:flutter/material.dart';
import 'package:hotel_app/utils/consts/paymentConsts/image_consts.dart';
import 'package:hotel_app/utils/consts/paymentConsts/string_consts.dart';
import 'package:hotel_app/utils/consts/paymentConsts/textstyle_consts.dart';
import 'package:hotel_app/ui/payment/widgets/bottom_button_widget.dart';

class PaymentMainScreen extends StatelessWidget {
  const PaymentMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const BottomButtonWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          PaymentStringConsts.appBarTitleString,
          style: PaymentTextStyles.appBarTextStyle,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(PaymentImageConsts.logoImage),
          SizedBox(
            height: size.height * 0.069,
          ),
          const Text(
            PaymentStringConsts.titleAboutPayment,
            style: PaymentTextStyles.titleAboutPaymentTextStyle,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 23, vertical: 20),
            child: Text(
              PaymentStringConsts.descriptionAboutPayment,
              style: PaymentTextStyles.descriptionAboutPaymentTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          
        ],
      ),
    );
  }
}
