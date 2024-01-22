import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/utils/consts/bookingConsts/colors_consts.dart';
import 'package:hotel_app/utils/consts/bookingConsts/string_consts.dart';
import 'package:hotel_app/utils/consts/bookingConsts/textstyle_consts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BookingAboutBuyerWidget extends StatefulWidget {
  final ValueChanged<bool> updateErrorPhone;
  final ValueChanged<bool> updateErrorEmail;
  final ValueChanged<String?> setPhone;
  final ValueChanged<String?> setEmail;
  final bool? hasErrorPhone;
  final bool? hasErrorEmail;
  const BookingAboutBuyerWidget(
      {super.key,
      required this.setPhone,
      required this.setEmail,
      required this.updateErrorPhone,
      required this.updateErrorEmail,
      required this.hasErrorPhone,
      required this.hasErrorEmail});

  @override
  State<BookingAboutBuyerWidget> createState() =>
      _BookingAboutBuyerWidgetState();
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
    widget.setEmail(email);
    widget.setPhone(phone);
    focusNodePhone = FocusNode();
    mask = MaskTextInputFormatter(
      mask: maskPhone,
    );
    focusNodePhone.addListener(() {
      if (!focusNodePhone.hasFocus &&
          (phone == null || phone!.length < maskPhone.length)) {
        setState(() {
          hasPhoneError = true;
          widget.updateErrorPhone(hasPhoneError);
        });
      }
    });
    focusNodeEmail = FocusNode();
    focusNodeEmail.addListener(() {
      if (!focusNodeEmail.hasFocus &&
          (email == null || EmailValidator.validate(email!) == false)) {
        setState(() {
          hasEmailError = true;
          widget.updateErrorEmail(hasEmailError);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            BookingStringConsts.aboutBuyerTitleString,
            style: BookingTextStyles.buyerTitleTextStyle,
          ),
          SizedBox(
            height: size.height * 0.023,
          ),
          TextFormField(
            focusNode: focusNodePhone,
            keyboardType: TextInputType.phone,
            inputFormatters: [mask],
            onChanged: (value) {
              setState(() {
                hasPhoneError = false;
                phone = value;
                widget.setPhone(phone);
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
                label: const Text(
                  BookingStringConsts.hintPhoneTitleString,
                  style: BookingTextStyles.inputPhoneTextStyle,
                ),
                fillColor: widget.hasErrorPhone == true || hasPhoneError
                    ? BookingColors.inputErrorColor
                    : BookingColors.inputNotErrorColor,
                filled: true),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextFormField(
              focusNode: focusNodeEmail,
              onChanged: (value) {
                setState(() {
                  hasEmailError = false;
                  email = value;
                  widget.setEmail(email);
                });
              },
              onTap: () {
                setState(() {
                  hasEmailError = false;
                });
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  label: const Text(
                    BookingStringConsts.hintEmailTitleString,
                    style: BookingTextStyles.inputPhoneTextStyle,
                  ),
                  fillColor: widget.hasErrorEmail == true || hasEmailError
                      ? BookingColors.inputErrorColor
                      : BookingColors.inputNotErrorColor,
                  filled: true),
            ),
          ),
          const Text(
            BookingStringConsts.inputInfoString,
            style: BookingTextStyles.inputInfoTextStyle,
          ),
        ],
      ),
    );
  }
}
