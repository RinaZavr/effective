import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/consts/bookingConsts/string_consts.dart';
import 'package:hotel_app/consts/bookingConsts/textstyle_consts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BookingAboutBuyerWidget extends StatefulWidget {
  const BookingAboutBuyerWidget({super.key});

  @override
  State<BookingAboutBuyerWidget> createState() => _BookingAboutBuyerWidgetState();
}

class _BookingAboutBuyerWidgetState extends State<BookingAboutBuyerWidget> {
  String? phone;
  String? email;
  String maskPhone = "+7 (###) ###-##-##";
  late MaskTextInputFormatter mask;
  late FocusNode focusNodePhone;
  late FocusNode focusNodeEmail;
  bool hasPhoneError = false;
  bool hasEmailError = false;

  @override
  void initState() {
    focusNodePhone = FocusNode();
    mask = MaskTextInputFormatter(mask: maskPhone,);
    focusNodePhone.addListener(() {
      if (!focusNodePhone.hasFocus && (phone == null || phone!.length < maskPhone.length)) {
        setState(() {
          hasPhoneError = true;
        });
      }
    });
    focusNodeEmail = FocusNode();
    focusNodeEmail.addListener(() {
      if (!focusNodeEmail.hasFocus && (email == null || EmailValidator.validate(email!) == false)) {
        setState(() {
          hasEmailError = true;
        });
      }
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Информация о покупателе', style: BookingTextStyles.buyerTitleTextStyle,),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            focusNode: focusNodePhone,
            keyboardType: TextInputType.phone,
            inputFormatters: [mask],
              onChanged: (value) {
                setState(() {
                  hasPhoneError = false;
                  phone = value;
                });
              },
              onTap: () {
                setState(() {
                  hasPhoneError = false;
                });
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "+7 (***) ***-**-**",
                label: const Text("Номер телефона", style: BookingTextStyles.inputPhoneTextStyle,),
                fillColor: hasPhoneError ? const Color(0x26EB5757) : Colors.white,
                filled: true
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextFormField(
              focusNode: focusNodeEmail,
                onChanged: (value) {
                  setState(() {
                    hasEmailError = false;
                    email = value;
                  });
                },
                onTap: () {
                  setState(() {
                    hasEmailError = false;
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  label: const Text("Почта", style: BookingTextStyles.inputPhoneTextStyle,),
                  fillColor: hasEmailError ? const Color(0x26EB5757) : Colors.white,
                  filled: true
                ),
              ),
          ),
          const Text(BookingStringConsts.inputInfoString, style: BookingTextStyles.inputInfoTextStyle,),
        ],
      ),
    );
  }
}